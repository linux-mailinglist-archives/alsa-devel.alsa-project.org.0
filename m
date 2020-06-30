Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0653220F2F4
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 12:47:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1AA31607;
	Tue, 30 Jun 2020 12:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1AA31607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593514022;
	bh=HCwlK42xB042oqF7MAHHSUKyEu4RNuEIcvJII2cfj1g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ooLktZxh6v7mO5tEW+ZjXOGlUZYgUQrRwBQ42uRrEuMe+oVyy5fxGp18k7V5agsjH
	 18Rk7m7V5i4UefO1ZdW9FL1ow2bd3PUgGjEdU9mzQf+PQ10fh94Jrok+6MqKSOhDKS
	 gcJnogx0LZbI1A4q41UTfyJI5cHRKbvHvyykY/Bo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDF8AF8022D;
	Tue, 30 Jun 2020 12:45:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26A35F801F2; Tue, 30 Jun 2020 12:45:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B289FF8013E
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 12:45:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B289FF8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RgTVEDZX"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B29792065F;
 Tue, 30 Jun 2020 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593513916;
 bh=HCwlK42xB042oqF7MAHHSUKyEu4RNuEIcvJII2cfj1g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RgTVEDZX01EVqYqLfOdTNEQOSbgsNYs8npVeIBBFE+rp1yLIUrdMrWppFoa77aR04
 IVKfrY9h5tntGo4pKMAInZn9L48ADjfSmMxec67wMCW28Fer4NQ/ParNsoEawFwx1p
 75enOI0s/p4r3CYIk1x1fFAU+4N6ejj9hE9zU+Ck=
Date: Tue, 30 Jun 2020 11:45:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v4 08/23] ASoC: soc-core: Fix component name_prefix parsing
Message-ID: <20200630104514.GE5272@sirena.org.uk>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-9-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3XA6nns4nE4KvaS/"
Content-Disposition: inline
In-Reply-To: <1593233625-14961-9-git-send-email-spujar@nvidia.com>
X-Cookie: Walk softly and carry a megawatt laser.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, nwartikar@nvidia.com, lgirdwood@gmail.com,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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


--3XA6nns4nE4KvaS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 27, 2020 at 10:23:30AM +0530, Sameer Pujar wrote:
> The "prefix" can be defined in DAI link node or it can be specified as
> part of the component node itself. Currently "sound-name-prefix" defined
> in a component is not taking effect. Actually the property is not getting
> parsed. It can be fixed by parsing "sound-name-prefix" property whenever
> "prefix" is missing in DAI link Codec node.

Any fixes should go at the start of a series so they can be applied as
such without needing to pull in the rest of the series.

--3XA6nns4nE4KvaS/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl77F7kACgkQJNaLcl1U
h9Ddygf7BrD+E2FcOp8W6S0EYnd7iYl0lFpKgh7ecrnG7StoGY3SPitqEAa0P2L3
2yl+I7bikIQtVPb0E0k55Fr8bnIo/b+7Gn5LGI+BnXRg6E8wU/nRIrmiu1Yg5Abo
QE5BLjDS98Bg3HmoR2qA3shJ6GM2bNOphemjtLP4gtd1ceCKoS143lR+XkkoSWoD
Vnw0bkyg86RJoLykmF1IwIjPdx0HtDygI9PhX/e0rOU9iDDCMmNGtAoFe0berc5d
/xUlYzSeVbpBbeCCT0g1Q/uZmAGUo0kydWp0pdPTqgjkzhTUNam6yY9L/25JBHsY
qf/OnFDPGSaSKEtgp8kltfZMcT1d4g==
=t15Z
-----END PGP SIGNATURE-----

--3XA6nns4nE4KvaS/--
