Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5D72CD5A0
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 13:39:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A74C1811;
	Thu,  3 Dec 2020 13:39:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A74C1811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606999191;
	bh=KM4Wr02SXLh1074qzic0DuxRqIuvx9/lq28Lt/Ej2Zc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CqORUDEEwnfQEu0k/P9ZBVmlZ4rdpS4v2txvQCKlmXOlq5uwqu4ySPDzWBg0SAxb9
	 QKf5oS4YaMAODl88gvHubLI8sQzCIPdPgrrBg9kbE8Aa8z+539cap9/pv5aSD1NV+R
	 EgPixfRR2+j9J1PVCSHgsIM/0pZ7A+7AIU+ang5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35DCCF80254;
	Thu,  3 Dec 2020 13:38:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9D89F8016D; Thu,  3 Dec 2020 13:38:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33934F80082
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 13:38:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33934F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D2WfaxuD"
Date: Thu, 3 Dec 2020 12:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1606999084;
 bh=KM4Wr02SXLh1074qzic0DuxRqIuvx9/lq28Lt/Ej2Zc=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=D2WfaxuDyy9BGS2+aYJ6wNzZ3OcfDTGe6VTALC0Ofc7wlurod5UVOznLit5Y4zdHD
 7c5IZHk0zxSjW9rnq2z2dObXII3aOczScZ5pZoW+r0mUWyLabJHcibRhbTTBulKxmM
 fExNslHtQSt/7TpwooWVO1pJQmZOP/DBKwM/+tsKu7UPghXSES30GIiwygM7eIjj8s
 MIeVCl8Ig9nf1HsJ3yRW2Wei5mpWj1dUavtxDQxRB4TBfs1xGGS1XdHsjJEbPspcLv
 qXc8sPzfTpLB+9anlbjzyfFmFntf+uLPRLBIKmqdSRNZOMeX3tf8ZUsPRwKkovsOGE
 UFBpmAlJ1C1CQ==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/4] ASoC/SoundWire: rt1316: Add RT1316 SDCA
 vendor-specific driver
Message-ID: <20201203123802.GD4700@sirena.org.uk>
References: <20201202143845.18697-1-yung-chuan.liao@linux.intel.com>
 <20201202143845.18697-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5p8PegU4iirBW1oA"
Content-Disposition: inline
In-Reply-To: <20201202143845.18697-2-yung-chuan.liao@linux.intel.com>
X-Cookie: Sacred cows make great hamburgers.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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


--5p8PegU4iirBW1oA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 02, 2020 at 10:38:42PM +0800, Bard Liao wrote:

This looks mostly good, a few small things below - if I apply please fix
incrementally:

> +static const char * const rt1316_xu24_bypass_ctl[] = {
> +	"Not Bypass",
> +	"Bypass",
> +};

Why is this not a Switch control?  If there's no strong reason please
submit an incremental patch converting it to one.

> +/* RT1316 SDCA function topology */
> +#define FUN_SMART_AMP 0x04

Full marks for picking this constant!

> +/* RT1316 SDCA channel */
> +#define CH_L 0x01
> +#define CH_R 0x02
> +
> +/* Power State */
> +#define PS0 0x00
> +#define PS3 0x03
> +
> +/* Mute Control */
> +#define UNMUTE 0x00
> +#define MUTE 0x01

A bunch of these could use namespacing, at least MUTE doesn't seem to be
used.

> +static const struct reg_default rt1316_reg_defaults[] = {
> +	{ 0x3004, 0x00 },

This should be in the driver, not the header file.

--5p8PegU4iirBW1oA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/I3CkACgkQJNaLcl1U
h9DWtgf/aK/2spBSeZvXa9EZuAdVBoQtuyARgWel+AYQp/3IC1Mbh2cbMRLpj1U2
Msa3b887aiOmg+M5JufhKJztr8bWh7LOzk2qh44k4Spv7+Y9S+Hr9dX4bdVTBNCn
0yN4bbv0KtnOuNL8Yxjs3n296ZwIYhgAEMVTmwf/wnDFg++hHTot1EfVyeAT3WEP
JuzZ+sahPTNZ7EiGuBq2kEUrUKu39wrha79VWAEQqjUy0rG9LMcwUjf4hGRnHdr5
rxnTO2I+rZIsBpvl8mIpZjEZY39PvAvGeIGqjb7Tz3gXiXa38cXe3n4s2wbmps2f
d+B0YQyk44aFKqTscooJX9A6ejGrOg==
=A/j2
-----END PGP SIGNATURE-----

--5p8PegU4iirBW1oA--
