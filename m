Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B05861582CD
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 19:39:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FD591673;
	Mon, 10 Feb 2020 19:39:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FD591673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581359993;
	bh=JjgEZh1ztUi6tSf2LE4pEkVja0HpAxuZgloF1z4ys5E=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BrmfMsHJiy9XppXvok/CScxhNWNa7+ZDlppml2EgzsFaTNdV8vla8EkXmmVugT9Le
	 RZfCHjo5AEbDfNkeyGhGNVsoaXW8ijs7HV/8l6KAIpgk1cGgnfBIBfmC4E81dgh9tx
	 pWpxewyvAbLpDDybVbdfd+O7lhuWOqSWvHEQ812w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4630DF80118;
	Mon, 10 Feb 2020 19:38:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0904FF80157; Mon, 10 Feb 2020 19:38:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8E800F80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 19:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E800F80118
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D25B1FB;
 Mon, 10 Feb 2020 10:38:05 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09AC03F68F;
 Mon, 10 Feb 2020 10:38:04 -0800 (PST)
Date: Mon, 10 Feb 2020 18:38:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20200210183803.GB14166@sirena.org.uk>
References: <20200204102016.I73b26b5e319de173d05823e79f5861bf1826261c@changeid>
MIME-Version: 1.0
In-Reply-To: <20200204102016.I73b26b5e319de173d05823e79f5861bf1826261c@changeid>
X-Cookie: No lifeguard on duty.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, dgreid@google.com, cychiang@google.com,
 jiaxin.yu@mediatek.com
Subject: Re: [alsa-devel] [PATCH] ASoC: max98357a: add speaker switch
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
Content-Type: multipart/mixed; boundary="===============6950681496233503609=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6950681496233503609==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 04, 2020 at 11:04:06AM +0800, Tzung-Bi Shih wrote:

> Some machine may share the same I2S lines for multiple codecs. For
> example, mediatek/mt8183/mt8183-da7219-max98357 shares the same lines
> between max98357a and da7219.  When writing audio data through the I2S
> lines, all codecs on the lines would try to generate sound if they
> accepts DO line.  As a result, multiple codecs generate sound at a
> time.

Rather than adding this in the driver it would be better to add some
_PIN_SWITCH() widgets to the speaker outputs, those exist for
essentially this purpose.

> +	max98357a->spk_switch = ucontrol->value.integer.value[0];
> +	dev_info(component->dev,
> +		 "put speaker switch: %d\n", max98357a->spk_switch);

These _info() prints are too noisy.

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BowoACgkQJNaLcl1U
h9A7VQf/XCuQw/2JSNwCMiUo1PCZCDVtwg2qZy5yQHhvz9hd5d8PXgInOo0qZIxy
KIxv7SggTHyDmFvUJPOR7VbMLEPaIzA0/Jcnk4bwmq9e7FRmoCxDsg8/VOZLd2r4
CBroF0IijCR2SyMPKmuJ9VAyTkqMj5R+zJXAaghLitNG+Enq5GE0/yLbBPGSY/FU
xEvkfmXxuNE7YAAAitL0HpuX2xF+wr5u1MabS1Q65DIv7EYU18G/NXUzzbZW7fhg
TG6JbqqeNmcnUvQ7kb7Jy7Nd2ii/Xi65boB7uwD3ilQDPJra9CHFl2kDgcDF+xv7
PyL3kIiKp8OLbEfgf7teNYxXYsJGNQ==
=SCkw
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--

--===============6950681496233503609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6950681496233503609==--
