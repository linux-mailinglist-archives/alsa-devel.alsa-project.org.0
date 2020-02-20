Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6D71668E0
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 21:49:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A3EE16B2;
	Thu, 20 Feb 2020 21:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A3EE16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582231764;
	bh=zhAIqLnnnv+wodCzFnBPaFPLL1axodY6rIUf0WW6IXA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bb1O1bfHYr82uo6/b9tbfuQaxWjCLOwwwAxeUTLJYDUnUpJDjhU3GvrcKu710CnxU
	 BEIsp1qUlzZuXx2KdtD8MdWCpTKzZyaxqlxICouBgVms5TdMm1A0fh9dVcAzs0KpLb
	 /bI7Sjv8gw90ZIkLjajwZNzfulvltY/WiK4pMdlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AA52F8011D;
	Thu, 20 Feb 2020 21:47:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D7B6F80148; Thu, 20 Feb 2020 21:47:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92663F8011D
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 21:47:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92663F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d/MuCgRG"
Received: from earth.universe (unknown [185.62.205.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8EF53208CD;
 Thu, 20 Feb 2020 20:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582231655;
 bh=zhAIqLnnnv+wodCzFnBPaFPLL1axodY6rIUf0WW6IXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d/MuCgRGhzj4SWM35SD0udulwCF++XSwdk6qoVb/vDe0O/IdUOopK+nJHPL2jApYF
 FQYTrlZTy+tMMPncuKH3JAnyr06NbncLW1PbKANYkgvP8SPRCF1cYhFm0vWzGaDUSS
 +adLvgsIyCqEdWHFTz5CCMEt613I5qcRUfgczAD0=
Received: by earth.universe (Postfix, from userid 1000)
 id 1142E3C0C83; Thu, 20 Feb 2020 21:47:33 +0100 (CET)
Date: Thu, 20 Feb 2020 21:47:33 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
Message-ID: <20200220204733.ktzhmmaytnglr5nh@earth.universe>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
 <20200214170322.GZ64767@atomide.com>
 <d9a43fcb-ed0f-5cd5-7e22-58924d571d17@ti.com>
 <20200217231001.GC35972@atomide.com>
 <5402eba8-4f84-0973-e11b-6ab2667ada85@ti.com>
 <20200218211631.fxojsxzvttoidfed@earth.universe>
 <a263a857-bb8a-0e37-6932-dd07df98ad63@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dedczlb2yot6jtdy"
Content-Disposition: inline
In-Reply-To: <a263a857-bb8a-0e37-6932-dd07df98ad63@ti.com>
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 "Arthur D ." <spinal.by@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>
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


--dedczlb2yot6jtdy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 20, 2020 at 04:15:22PM +0200, Peter Ujfalusi wrote:
> > I suppose in the end its a question if generic card can provide TDM
> > support.
>=20
> Sure it can, but can it handle the switching between the paths based on
> use cases?
> There should be machine level DAPM widgets to kick codec2codec (MDM6600
> - CPAC_voice for example) and also to make sure that when you switch
> between them the system is not going to get misconfigured.
> Switching between CPAC and BT route during call?
> Not allowing VoIP while on call, etc.

I think the main issue is, that based on the route configuration
(which could be a simple DAPM widget generated by the simple-graph-card),
we may need to configure different bitrates. Tony's hack adding
this knowledge to the cpcap driver is very ugly.

> >> In case of B/C you should not have a running stream imho.
> >=20
> > I would expect, that MDM6600 codec marks itself as running/stopped
> > based on call state. That should enable DAPM widgets automatically
> > when CPCAP_voice is routed to MDM6600?
> >=20
> >> In all cases CPCAP_voice should be able to run the clocks on i2s,
> >> even if it is not used by the audio setup.
> >> Not sure if you can just turn Wl1285 as master, but it is possible
> >> that it is master, but silent when it is not used?
> >=20
> > I provided CPCAP registers for BT call, which should be enough to
> > figure this out (I did not yet analyze the results myself).
>=20
> I got the datasheet from NXP (thanks for the pointer!), I try to look at
> it in a coming days.

FWIW the datasheet is not for the same chip, but for a similar one.
The audio part seems to be very similar though.

-- Sebastian

--dedczlb2yot6jtdy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5O8GEACgkQ2O7X88g7
+pqQ/hAAgEqBO6UXtQnbUsOTqAxQ6FWYfr2uOwPllZ/qaDcYwXg4/JKMDlkdj/TN
NVLSo98L3HRUIyVzofJJ8/mNuz26OnUDF+Jmp/NDVyWm494i284b4UcejTuq2QZF
PIUBEuEZAbXjZssKqNiWLK0sIbhSfGGjFwKMHJL7u5hnQ4LTBtjIbiQ7hcIfZIR0
wxpoMupM9HqVuw3Ulic8Vq8bIWWbVy2S8ockuZn5H9R6fACBGJA+gJCcv+jb0xDl
18Nf/b/aYsufjaNuX+cxEI2h8xvzzzr/hOAhXoBTju6UPFr4bHUmDPhV3ycxRMib
eRgZ96TX6Gur53dPVz2KxG1Xx6LDsLfqYAvojww6PL5O37xx531jk+z/5w4yUvB1
zNOq8dEyJsPFfG3JH3racUr/GEkdllORvAn5T5Dbbt28kEFs7YuDujwe5yIXi/YR
Ve557gjSI6/xWSTA4zlJjzffOYWBg67+JDRiw/V1C1sV+1Eqx+xGsGhq9QqNqyld
lkAh3Z5FNPvQbgFofHn+7l7VPu2FH4SfVDow2DCa7gEee90Wwr8SxxaQ/+z6Tghw
tOTTER2jXWCdZ74WxrJITLKVT4SRBXwNvcC9/jNMiHmb8q6T9Zr2lmJQ13GRyCoT
2YBZjeEgOkLi8aKbqHMT3lgfK1r9j43SRZCGy2i/zCc0PiIN+L4=
=d1zp
-----END PGP SIGNATURE-----

--dedczlb2yot6jtdy--
