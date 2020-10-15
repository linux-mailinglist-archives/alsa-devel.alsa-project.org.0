Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E528F67F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Oct 2020 18:14:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEA78177F;
	Thu, 15 Oct 2020 18:13:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEA78177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602778487;
	bh=wYeGNA65xooghznt1NdP+AJ2P2uDRvjHr3QQlhRQdJE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=si9BCc5aTlAcop6/OEa2Pz85aOQC7EGRbIEntMgmneI7EOUXWDsO245ROzHkXPg0v
	 ILXZCee+aTfSm64UfuI6nbMT08KlqjdNf4+UPaF63UHrxJEIWatls3EVqFzvQe/3SM
	 EqfyEhPEJMLrobAEdYaPvpDSfPUNjJbdu63AblAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A29BF80269;
	Thu, 15 Oct 2020 18:13:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1370F80268; Thu, 15 Oct 2020 18:13:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A4A3F8012A
 for <alsa-devel@alsa-project.org>; Thu, 15 Oct 2020 18:13:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A4A3F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zv64p4zB"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E68D421D7F;
 Thu, 15 Oct 2020 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602778378;
 bh=wYeGNA65xooghznt1NdP+AJ2P2uDRvjHr3QQlhRQdJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zv64p4zBHeZ3PPxAhPoimJW4wUmg5nR1YqruXK6ydTfrKj6gxgDs/npmBfiBUDRPJ
 nsmJobGaaDVM4rUT1Y/GTiitd3qgAuMtyxsJFK1Q7wbh8egz6TfyLLrxay9FmUCqOf
 RgqjlfejcNXGsg3/jrusuIfun2/skkP3Alzhz6xA=
Date: Thu, 15 Oct 2020 17:12:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Cheng-yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
Message-ID: <20201015161251.GF4390@sirena.org.uk>
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Pgaa2uWPnPrfixyx"
Content-Disposition: inline
In-Reply-To: <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
X-Cookie: Neutrinos have bad breadth.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Taniya Das <tdas@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Rohit kumar <rohitkr@codeaurora.org>,
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


--Pgaa2uWPnPrfixyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 15, 2020 at 03:59:26PM +0800, Cheng-yi Chiang wrote:
> On Tue, Oct 13, 2020 at 6:36 PM Srinivas Kandagatla

> > > +properties:
> > > +  compatible:
> > > +    const: qcom,sc7180-sndcard-rt5682-m98357-1mic

> > This information can come from the dai link description itself, why
> > should compatible string have this information?

> I think dailink description is not enough to specify everything
> machine driver needs to know.
> E.g. there is a variation where there are front mic and rear mic. We
> need to tell the machine driver about it so
> it can create proper widget, route, and controls.

That sounds like something that could be better described with
properties (including for example the existing bindings used for setting
up things like analogue outputs and DAPM routes)?

> The codec combination also matters. There will be a variation where
> rt5682 is replaced with adau7002 for dmic.
> Although machine driver can derive some information by looking at dailink,
> I think specifying it explicitly in the compatible string is easier to
> tell what machine driver should do, e.g.
> setting PLL related to rt5682 or not.

These feel more like things that fit with compatible, though please take
a look at Morimoto-san's (CCed) work on generic sound cards for more
complex devices:

   https://lore.kernel.org/alsa-devel/87imbeybq5.wl-kuninori.morimoto.gx@renesas.com/

This is not yet implemented but it'd be good to make sure that the
Qualcomm systems can be handled too in future.

> You can see widget, route, controls are used according to the configuration.
> The alternative approach is to check whether "dmic-gpio" property
> exists to decide adding these stuff or not.
> But it makes the intent less easier to understand.

OTOH if you have lots of compatibles then it can get hard to work out
exactly which one corresponds to a given board.

--Pgaa2uWPnPrfixyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+IdQIACgkQJNaLcl1U
h9Cs0gf/aR5zd1VPFM/nOmIp2Or27oiqOMSopuxWeT8ZLdCC0srj7gRTUI8522lz
izypzvOW3riGLBh7X3uPWB5LyKHA80pa0yhNrAdJLBzmW0V5OlJ5Wt9VBz4V+qyq
oIfmqS/jhFQ4pPGdKQDPhV2NPLK7NT40qcSmCuqrCPR49XcqvTUt7PmETCp1LuqC
p5vUj1AqXOHLBRbmy6yc7svns2YEGkH3bxd5MED59nadECZl8QmCVWW+VHERFMnf
r5J8EW8FiPMaE6WRwmzf7KdPDHmfFJrRbCGjq9SiwS1qGre7qUdXm0lGagA3YUIq
KhE0K1VXxuMUGRohRmQ/sE555zuDBw==
=ZOAb
-----END PGP SIGNATURE-----

--Pgaa2uWPnPrfixyx--
