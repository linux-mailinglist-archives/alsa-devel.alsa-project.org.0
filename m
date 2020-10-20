Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0FF29435D
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 21:41:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEAB41734;
	Tue, 20 Oct 2020 21:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEAB41734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603222888;
	bh=UdgnNWumPxY1W96SexJ8p035CUKD9xNftds7uTA3ZK8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UNa3CurcL2So+uKDASTw20SFxEXVkS+YO7uAM8GCF9BgJu7yafvIlGLUak4B9gRt3
	 r6jFWwWPZ34sYMjKBqWIqDBa3faqBkgtBRBMIndGnmdMGhk0EC9hEoCmOsCPOMsPmv
	 tqPvGnrHxjhrGW23zvfTj2fSRfVyYagmRu+A+cTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81AF0F804A9;
	Tue, 20 Oct 2020 21:39:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E134BF804AB; Tue, 20 Oct 2020 21:39:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2633F804A9
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 21:39:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2633F804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H+SgDQ1y"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89CFF2225D;
 Tue, 20 Oct 2020 19:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603222776;
 bh=UdgnNWumPxY1W96SexJ8p035CUKD9xNftds7uTA3ZK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H+SgDQ1yyKmeI7/XvknsTfx3uKsx0C4YIEiaKTndN+kZHjVJccqivzcHeSqv/1DKK
 iCB3+nwQLtxtab1fEN+Zo69syX/jDw+7kTuRtWvK5ikn8DeNKfxdBnCG40uijfbVoS
 EhWcV3WGdtk+RaJj4lEO5WJeTflpJgATgvtBei0U=
Date: Tue, 20 Oct 2020 20:39:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Cheng-yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
Message-ID: <20201020193925.GF9448@sirena.org.uk>
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
 <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
 <20201020143711.GC9448@sirena.org.uk>
 <CAFv8NwKuLjLeM1KLeV8Br2TZC8L7DO6KWHL=pXvhAUV5+wSBPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oFbHfjnMgUMsrGjO"
Content-Disposition: inline
In-Reply-To: <CAFv8NwKuLjLeM1KLeV8Br2TZC8L7DO6KWHL=pXvhAUV5+wSBPg@mail.gmail.com>
X-Cookie: The people rule.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Taniya Das <tdas@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Patrick Lai <plai@codeaurora.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Srinivasa Rao <srivasam@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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


--oFbHfjnMgUMsrGjO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2020 at 02:51:33AM +0800, Cheng-yi Chiang wrote:
> On Tue, Oct 20, 2020 at 10:37 PM Mark Brown <broonie@kernel.org> wrote:

> > If the device has both front and rear mics and only one can be active at
> > once that seems obvious and sensible.  If the devices only have one of
> > these then this seems like a bad idea.

> trogdor board: only front mic.
> pompom board: having both front mic and rear mic. Only one of them
> will be used at a time. It is toggled by mixer control backed by a
> gpio.

> My proposed solution: instead of using compatible strings, expose only
> dmic-gpio property.
> When the machine driver sees this property, it uses the dapm widgets
> and controls created in the machine driver.

Yes, that is what I would expect.

> > I don't understand what "logic scattered in various dtsi files" means,
> > sorry.

> I mean I don't want to use device property to pass in widget name,
> type, text and callbacks.
> Let me give an example:

> - Board trogdor uses front mic, rt5682, and max98357a.
> - Board pompom is based on board trogdor, but it has front mic and rear mic.
> If we somehow managed to add the code to pass in widget, route, type,
> text, and callbacks needed for dmic control, we will need to put a
> bunch of properties in trogdor-pompom.dtsi file.

Most of this code is already there as part of the generic card
infrastructure, the only thing that stands out for me is the GPIO to
switch between the front and rear mics.

> - Board ABC is based on trogdor as well, and it has front mic and rear
> mic, but with a different speaker amp.

> To use widget, route, type, text and callbacks for front mic and rear
> mic, in trogdor-ABC.dtsi file we would copy some properties used in
> trogdor-pompom.dtsi file. To support the different combination of
> codec, we would need some modification of the route and widget.

It shouldn't be hugely difficult to split the DT files up usually, and
ideally they'd be small enough that just having an entirely new sound
bit isn't the end of the world.  Again I'm just not clear what you're
seeing here.

> > The CODEC change is going to be described in the DT no matter what -
> > you'll have a reference to the CODEC node but it may make sense if
> > there's enough custom code around it.  For front vs rear mic the
> > simplest thing would just be to not mention which if this is a hardware
> > fixed thing, otherwise a control.

> Would you suggest checking whether the codec node is a rt5682 node,
> and call required PLL calls accordingly ?

Potentially, or there might be so little shared that it's just a
separate machine driver.

> "For front vs rear mic the simplest thing would just be to not mention
> which if this is a hardware fixed thing, otherwise a control."
> Sorry I am not sure if I understand this correctly. Please correct me
> if I am wrong.

> - For default case having 1 mic: not mention this at all
> - For front mic / rear mic case: see gpio property and use an
> additional control.

Yes.

> "These feel more like things that fit with compatible" regarding
> replacing alc5682 with adau7002. Please let me know which one solution
> you prefer:
> -  deriving this information from codec node
> -  deriving this information from different sound card name

To an extent this depends on how different the CODECs and general setup
are but a different CODEC is something that often justifies a separate
compatible.  Of course you also have an awful lot of systems that work
with the generic card drivers and all different kinds of CPU and CODEC,
usually because the driver doesn't need to know anything about the
implementation of either.

--oFbHfjnMgUMsrGjO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+PPOwACgkQJNaLcl1U
h9Aikwf/cynQzcrnT9zavQbVgUM4IpP4TyshlCrJfrrtg2rnigRO/tJDK7eYQvoU
i8t45o6LbCdnh6avdl5zMLxi3tRLw3DAArA7f6OqW+3qH654iwE8Xdu8qg757bLy
kX50QfhefTMQqL3DGFNdORYWx3HB3PI8u5SWN9akkAxFJksNBKw4CjdsipJ6BgRj
k4t4u0owVRNJRuG/egx2TNt8/FziiX29lTQPrtRQsgae7au3O4POXzvYYoxeeOYS
fUuzo+wdtgqImF8sXYdRpRQ6a3sCgcXW5qWZhjmmbtPvIlTx3cHuwNnQDy7xGUjB
XO/DmKtA4HIUE0BNgckWhNOQHVcTjw==
=ybKE
-----END PGP SIGNATURE-----

--oFbHfjnMgUMsrGjO--
