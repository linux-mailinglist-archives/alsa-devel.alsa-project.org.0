Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ECE3244B6
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 20:39:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C27AC1662;
	Wed, 24 Feb 2021 20:38:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C27AC1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614195563;
	bh=30o+o6MkJ2gIJY5NKDszt+7E1dmuQlR9j02NYmwxEyk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o9hM1LDNkDYFTV8F8gUpoy11U5C/8a1OFhgjcxlyheacnU1nDW2v9in1Z4nTgOxVb
	 U0nsfDclr/KJ+riGDFclpZnxeaE5j25FndkUw4bVApEhjk/ApJQ8gcoXvDu23zxciN
	 v2BEPzgIRdkCsq1z+/PLd1uqXjhg8ilnl5JtJQTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2CB2F8022B;
	Wed, 24 Feb 2021 20:37:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC208F8016C; Wed, 24 Feb 2021 20:37:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42CCEF80159
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 20:37:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42CCEF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GxWHTzfp"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4253064ECF;
 Wed, 24 Feb 2021 19:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614195449;
 bh=30o+o6MkJ2gIJY5NKDszt+7E1dmuQlR9j02NYmwxEyk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GxWHTzfprpaikMwT9FlbK7sMFe27JhhIbB0t7eM4QrKDjkeUpnFbWc1Y13ilZCOiZ
 URwoMG0TULF3fWZxAF/4DYaqn8J7qP/HoHG4nbVjB1gnDd/FwWSYpjc57U1Ei0shZd
 h724ofGGM6vDXAId/adKMseG06ckefZlY0UZ5EwCqJCslUG2EYPlNN1Y2vh231LOYP
 DFDIdSreTNsOQQri/k4TR4Fkln365x97ZW9p8AYxPi4zULvhtFgzfyc9s32v5YEjTU
 2h/7ttJc9Iymt53O/DWwRF89/LFWw4Ej/VY63ovV4LP611jEqIReHHkaTP82WY1ojK
 Q9douVQrmnSBg==
Date: Wed, 24 Feb 2021 19:36:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
Message-ID: <20210224193626.GF4504@sirena.org.uk>
References: <20210215142419.308651-3-hdegoede@redhat.com>
 <20210223134506.GF5116@sirena.org.uk>
 <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
 <20210223140930.GH5116@sirena.org.uk>
 <s5h8s7evp8p.wl-tiwai@suse.de>
 <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
 <20210223172055.GI5116@sirena.org.uk>
 <fe2941de-02ce-9ed0-70ff-d7967aeecc44@redhat.com>
 <20210224125927.GB4504@sirena.org.uk>
 <e47c7fa5-cb1a-f8a3-bfe4-1f6bca6a7d80@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aPdhxNJGSeOG9wFI"
Content-Disposition: inline
In-Reply-To: <e47c7fa5-cb1a-f8a3-bfe4-1f6bca6a7d80@redhat.com>
X-Cookie: He's dead, Jim.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <bard.liao@intel.com>
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


--aPdhxNJGSeOG9wFI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 24, 2021 at 08:14:12PM +0100, Hans de Goede wrote:
> On 2/24/21 1:59 PM, Mark Brown wrote:

> > The problem I was thinking of is the situation where there are multiple
> > options for the mute control in the hardware and it's a configuration
> > decision which one to use.

> ATM we have no device where this situation happens, so I would prefer
> to cross that bridge when we come to it.

You just added wm5012 machine drivers, that device is going to present
issues with this approach.

--aPdhxNJGSeOG9wFI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA2qrkACgkQJNaLcl1U
h9ACHQf/VPWITVndZTG8W97loZw2wqciHICDC1NehkLMfJ3QckTwv3yl6z+6GvPp
b1eHjleI3SGKXeHp0mjnbqzyjMs7F9K8twf8DhFkGk9u6OOOpnBcuibvt+WzRtIJ
Mwqf+KDLQezCc9/db4szsnLeuIeeNjG6nkFWd6gDCqZiiqtIvGbGVhf2QL1x/aiQ
HX0zvHTWdvkiAdLJbwYF8AS2XODbeB/MwsmkSO4132aaMJxid825DC5BsPpdNsxn
XRTOxsIGP0t4jrNikOVaodUyyAgp14ED8Pmm7Jv2fqM9d4XaGFbdI273PoMgabTV
UZvfBBTmsKRVnocFeOlzgtnKRoTNng==
=x9wN
-----END PGP SIGNATURE-----

--aPdhxNJGSeOG9wFI--
