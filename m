Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6721911CCCC
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 13:07:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF14116D2;
	Thu, 12 Dec 2019 13:07:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF14116D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576152478;
	bh=1W8ScfSJthURdnvX2YRGZDGDYsS/vBIJ3hfFosPoE/w=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dJBQ7Mo/9zlKO4R/PHVHIE9nUFm2oOnXyHSa/paOh5lEJ7kftB9CrHDv28L/mg5EF
	 LZZARJYMb6Pr6Ybvs3MvrMAAZm1cE7EzpUSrsP+ugFjVp915cwftbfRiucz7t0bT/w
	 RmvlH0EABirA24DzE0cpS7tXIkc62GjNhm1MeY1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25C7FF80232;
	Thu, 12 Dec 2019 13:06:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB214F8020C; Thu, 12 Dec 2019 13:06:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4AA5BF80139
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 13:06:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AA5BF80139
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A3F81FB;
 Thu, 12 Dec 2019 04:06:07 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0726D3F718;
 Thu, 12 Dec 2019 04:06:06 -0800 (PST)
Date: Thu, 12 Dec 2019 12:06:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Jeff Chang <richtek.jeff.chang@gmail.com>
Message-ID: <20191212120605.GA4310@sirena.org.uk>
References: <1576148934-27701-1-git-send-email-richtek.jeff.chang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1576148934-27701-1-git-send-email-richtek.jeff.chang@gmail.com>
X-Cookie: We have DIFFERENT amounts of HAIR --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, jeff_chang@richtek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Add MediaTek MT6660 Speaker Amp
	Driver
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
Content-Type: multipart/mixed; boundary="===============2756255989560919508=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2756255989560919508==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 12, 2019 at 07:08:54PM +0800, Jeff Chang wrote:
>     The MT6660 is a boosted BTL class-D amplifier with V/I sensing.
>     A built-in DC-DC step-up converter is used to provide efficient
>     power for class-D amplifier with multi-level class-G operation.
>     The digital audio interface supports I2S, left-justified,
>     right-justified, TDM and DSP A/B format for audio in with a data
>     out used for chip information like voltage sense and current
>     sense, which are able to be monitored via DATAO through proper
> ---
>  sound/soc/codecs/Kconfig  |   14 +

You've not provided a Signed-off-by so I can't do anything with this,
please see submitting-patches.rst for an explanation of what that is or
why it's important.

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3yLSoACgkQJNaLcl1U
h9CfvQf+OwqaS6opHAx708EXSW3weHgQ0koD3aM3Ti2vyAWlAztKo1uyctXylitF
tyVzUCsBptcVFwwkhCYncnk/VzS3vz0NvWg9D7yNrfCE8Vc9IIhuqk9g4V10PmyU
KALFmhFVlK+J68pBpdln63KeqmBcuAO9EkNq7B3D28SVXZkb1Q35nIQFRmCOXsd2
zmmlFzZzSBV8L6RLLPcXHmfFfiOhsebyzgz/eE4e+l2diJAH1khhnko9JX5EaDq9
WGdnsm4QUiEOk1Vgg6c7PLRheaeupPapijBxIRualBZSNewoaKveKxcPoGZrZaC0
i4WjYS7UJY6DqBHdh5yG31iOcgvjJw==
=KCrs
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--

--===============2756255989560919508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2756255989560919508==--
