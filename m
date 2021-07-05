Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8D13BC25C
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 19:44:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7F1316B2;
	Mon,  5 Jul 2021 19:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7F1316B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625507092;
	bh=bXlnuLgazQj2meMgG4cEjc2movH3UbvP3OkyY+5bsG8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IigAjhw/734gpzibm+p9i1SID5LDQnCyqlyJIlbPSR2S5FknAMXVyCRllSOtr4pJC
	 P9p0LmacBPxy4gjC/RjPJUc1raQSn/xmgaOTTbM/mimVibhR8DZlLmQavcUn1d5UIf
	 rgjWS6TuEkz0SugpxAH+Fgwx/UIpp+1TVGwGSxfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38244F8016B;
	Mon,  5 Jul 2021 19:43:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCDC0F80224; Mon,  5 Jul 2021 19:43:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4200FF8014E
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 19:43:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4200FF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NuCLpuRf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F9D7611ED;
 Mon,  5 Jul 2021 17:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625506992;
 bh=bXlnuLgazQj2meMgG4cEjc2movH3UbvP3OkyY+5bsG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NuCLpuRfSCy6zFng7F7kcQIgdWFfDnoCetQaxlVTkyI9+7PLx//3nAyBFLGpdgGvX
 1KNkezYZ20RtIMQO0bXqiMWgTQpWVQd4AueyAVGliGhWRTr4FV1zyFbFgwRdmzUhUb
 03m8QwZEIYai6MqukNvbEkzo/hdvL9tP6wJ1kNBs7P0gJ1LlqbnCyWUATYb3ccLLkc
 UNF+u+GD0K/6TwXPKZt5AoA7FxSyFe3bXZq4AM60xMBXaeWknkVYbnQ3cnlRKk4SIE
 NRhf0e6go4f9Jhwpa2MO9E+cxhhNoY/wr6VtYaK1ADnsOQabpFcjNtR7VEURg+RjW4
 NjU31JYxVp6PQ==
Date: Mon, 5 Jul 2021 18:42:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <vijendar.mukunda@amd.com>
Subject: Re: [PATCH] ASoC: add dai_reoder flag to reverse the stop sequence
Message-ID: <20210705174241.GF4574@sirena.org.uk>
References: <20210705155830.24693-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Pgaa2uWPnPrfixyx"
Content-Disposition: inline
In-Reply-To: <20210705155830.24693-1-vijendar.mukunda@amd.com>
X-Cookie: Star Trek Lives!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, amistry@google.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Chuhong Yuan <hslester96@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, peter.ujfalusi@ti.com,
 Alexander.Deucher@amd.com, nartemiev@google.com
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

On Mon, Jul 05, 2021 at 09:28:28PM +0530, Vijendar Mukunda wrote:

> @@ -982,6 +982,7 @@ struct snd_soc_card {
>  	unsigned int disable_route_checks:1;
>  	unsigned int probed:1;
>  	unsigned int component_chaining:1;
> +	unsigned int dai_reorder:1;

This feels like it should be a per dai_link option rather than a card
wide option - the system could have a mix of links that do and don't
want this depending on why it's an issue.  The name probably also wants
to be more specific to what's being reordered, something like
stop_dma_first for example since it's only for stops and moves the DMA
first.

--Pgaa2uWPnPrfixyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDjRJEACgkQJNaLcl1U
h9Ad1wf+ODiFiCnjZAzJXHv3jIrxKfUZB9Fe48MZPeeN1PjK4BgqyHYo6O5BnzW/
ODBJKx4nWtiBFIyT39nEmZIXWNaFkThhfW35aGgMkLjv56IHXWIYeAipR2a5tohk
ltWhE/YLIpfO+ktdNievZ6RTuxXbTzu/+N9E3Hw8hlLUMmDrAwt5dWc8IU/HKTst
1V+nSCB8G8vA2mHCg/Jo1z6BZxnyWBHXmG4ukKhl9soNjK+qwQ+VqBemFOCRCMsY
cxKGZtfY55/kxrPNakKnK632FGMeGZ2PGVWUelUb62YwRHEjd8i+9ieWd7sbaaVk
4vpi5Ihu+HTFNipGFWid20ioKsL0FQ==
=Byu8
-----END PGP SIGNATURE-----

--Pgaa2uWPnPrfixyx--
