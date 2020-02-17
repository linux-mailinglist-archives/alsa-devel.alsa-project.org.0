Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC04A161675
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 16:44:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75294166C;
	Mon, 17 Feb 2020 16:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75294166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581954290;
	bh=kU6gKL4v1gWycgfPl806VJHpp311C/YIJqbT914BOUQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VOOjsLghqk29IO/OwoHnGam8CFOYvE0exD3DxNprAbjhxBD9fRuo+7ZjUQl6+rbs2
	 XhjRJSjdGuVRHRBTplOsA+yTOqph2Tb001vdzTuSE1EezG6b/BH/nFa7diA6k/gdFw
	 T2Kt0/UJxG3wbfZaem3jQy0MhL2poEmRRiZyOuwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F381F801F4;
	Mon, 17 Feb 2020 16:43:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3627F80172; Mon, 17 Feb 2020 16:43:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 0993FF80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 16:43:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0993FF80096
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F72C30E;
 Mon, 17 Feb 2020 07:43:03 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 982983F703;
 Mon, 17 Feb 2020 07:43:02 -0800 (PST)
Date: Mon, 17 Feb 2020 15:43:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Message-ID: <20200217154301.GN9304@sirena.org.uk>
References: <1579443563-12287-1-git-send-email-spujar@nvidia.com>
 <20200217144120.GA243254@gerhold.net>
MIME-Version: 1.0
In-Reply-To: <20200217144120.GA243254@gerhold.net>
X-Cookie: There was a phone call for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 tiwai@suse.com, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [RFC] ASoC: soc-pcm: crash in snd_soc_dapm_new_dai
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
Content-Type: multipart/mixed; boundary="===============2704214401570002124=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2704214401570002124==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b1ERR0FXR0PvNIRE"
Content-Disposition: inline


--b1ERR0FXR0PvNIRE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 17, 2020 at 03:41:20PM +0100, Stephan Gerhold wrote:

> I'm a bit confused about this patch, isn't SNDRV_PCM_STREAM_PLAYBACK
> used for both cpu_dai and codec_dai in the playback case?

It is in the normal case, but with a CODEC<->CODEC link (which was what
this was targeting) we need to bodge things by swapping playback and
capture on one end of the link.

--b1ERR0FXR0PvNIRE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5KtIQACgkQJNaLcl1U
h9ARMgf+NQDaYx839skXXMcRLyATLepufKGk9l1m2+rsQ1ajEhuvgD8/e4YhVxcE
kbFp40QlkXHOJVhDmDdTzdGQAVw4bZUk4++qr0sv9wbyPE/vnN1eL1g86TN2jYYR
p6N2CzZLf6bqK10PNGgBxKu7ybsFm745FxIhEcPkYEAKUF3H9PANqu8hLvwmTNdW
YRUBomA6kOqU+odw/XwK8ztCS5cruwTjaAHZP6QsiHuGWFovmomqXJRNZhcpWXRU
HJnA40MLOI6wqd1eKDL+sZsIh26xr5hapqLdLYBwvXCh8gzup+ECt59LHEm/7hdQ
OePPOr10MHw9LA7a4ByEiuvTidCFUw==
=44+D
-----END PGP SIGNATURE-----

--b1ERR0FXR0PvNIRE--

--===============2704214401570002124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2704214401570002124==--
