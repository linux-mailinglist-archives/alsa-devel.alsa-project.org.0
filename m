Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7991717A1
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 13:39:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96028169E;
	Thu, 27 Feb 2020 13:38:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96028169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582807177;
	bh=z+/TFPWWZ/v/DAeVF8jj8cL3hIQOlnu6Hah1TliDYLI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JoO8wvygH7VPZ9noADM7qAFBq5o+xJJ6QJaXUbXvGGQV4FYuDO9EgDcHILxp97KsC
	 z1aWb67SpOU5WYRQ1rcqHxa1sm55XinC3OZF0WK4TfTHU0TKJrsPZuRByOmRbAXhtv
	 dCmyTdfDLo3fDABPLN64//rGlzaTqgZyKyUCZahg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 965AAF8013E;
	Thu, 27 Feb 2020 13:37:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D9BDF80142; Thu, 27 Feb 2020 13:37:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A216FF80089
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 13:37:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A216FF80089
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C57B1FB;
 Thu, 27 Feb 2020 04:37:48 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86F173F73B;
 Thu, 27 Feb 2020 04:37:47 -0800 (PST)
Date: Thu, 27 Feb 2020 12:37:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 6/8] ASoC: soc-pcm: check DAI's activity more simply
Message-ID: <20200227123745.GA4062@sirena.org.uk>
References: <87o8tk7q34.wl-kuninori.morimoto.gx@renesas.com>
 <87ftew7q12.wl-kuninori.morimoto.gx@renesas.com>
 <878sko7o0e.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
In-Reply-To: <878sko7o0e.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Edwin Meese made me wear CORDOVANS!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 27, 2020 at 11:38:41AM +0900, Kuninori Morimoto wrote:
> > @@ -1225,15 +1224,10 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)

> > +	for_each_rtd_codec_dai(rtd, i, codec_dai)
> > +		if (codec_dai->active)
> >  			snd_soc_dai_digital_mute(codec_dai, 1,
> >  						 substream->stream);

> I noticed that it calls snd_soc_dai_digital_mute(xxx, substream->stream).
> This means, it want to call mute for each Playback/Capture "last user".
> This patch was total wrong.

> Mark, [6/8] is wrong. maybe I need to reconsider [7/8].
> Can you please ignore these ?
> Please let me know if you need v3

I can drop those two, it's fine.

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5XuBYACgkQJNaLcl1U
h9A/hQf/bwKlG2jjXr5hw10+tGAE9lB3IrFpDmk6Yk9c6gD0vXkgUL+YK9m2AJGE
7vdoC9klinx4CZxCWNi9UNMs+ejOl9bQLgu+Obucts4y7KN3yRVP2ZTPm5cSQZe7
xSPy4PMmy1/PnfScYFiJIuadiP6It9FvGBFaAk9g9vVdCvCFPGgbQAzqfy1iN/Ld
1Gstbk1tQHj+GOnooKN9/LX9cfx2xtGYauLDdpciPyG0luWBkbcx8nIf/sV9dJq5
mAUVpvNAt0RSmpUbU2ZInL5FyhGec8Z9PnD6qzzVXtwA3T/Ry/HVzZY3+txj2V7J
n3Zf5QsJc2VgVH7YFrsy3klJpM1gyQ==
=ny3D
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
