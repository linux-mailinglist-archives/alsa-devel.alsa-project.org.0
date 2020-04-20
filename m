Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 582221B0952
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 14:28:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DAD51686;
	Mon, 20 Apr 2020 14:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DAD51686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587385708;
	bh=CB1cs2u7sCQVW6VgECnDyk16dVAwP9xS4baH8lRPRVA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zu6MZIwrEaczFtxQ/ztErFMLn1QZx5k3xjQ6MIAqYVzopdNCVQYoK/fujwwMHwATG
	 hW44Hp6JinTFD+fs1EExhKmeFRjZmpIHqMMduqa8/E6YdeIUGKbeZhDF9YOpbMxIyb
	 sNBApUQyyvEt6rj0S0lGIHgREGzwZRPOXafz9HnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 625D0F8020C;
	Mon, 20 Apr 2020 14:25:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18CC0F801D9; Mon, 20 Apr 2020 14:25:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC9DCF800C8
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 14:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC9DCF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LF8Y3OAr"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FABA206D9;
 Mon, 20 Apr 2020 12:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587385537;
 bh=CB1cs2u7sCQVW6VgECnDyk16dVAwP9xS4baH8lRPRVA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LF8Y3OArgCWn7DFuv9/bZeEiSa6eZPi9IKIUIONwU2K/JXT+GJQ2617xXVajSIUvB
 Mq3bJZEP+TPPKlkBSO9Uc/15eIFutv4+DUEeKZfts1vRMOw30LbCYY13l665R2gwm1
 PPX+ncsMs/xCd0v+sJyZDPJzB5CLsOsDxVLKEVNw=
Date: Mon, 20 Apr 2020 13:25:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add Microsemi ZL38060 binding
Message-ID: <20200420122534.GC6507@sirena.org.uk>
References: <20200417221341.31428-1-TheSven73@gmail.com>
 <20200420121542.GB6507@sirena.org.uk>
 <CAGngYiWauBTnXDcP9UC1S7U5Ogy0B=bUZSdGs1Z9aKZ2+sB=Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Content-Disposition: inline
In-Reply-To: <CAGngYiWauBTnXDcP9UC1S7U5Ogy0B=bUZSdGs1Z9aKZ2+sB=Qw@mail.gmail.com>
X-Cookie: Can you MAIL a BEAN CAKE?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>
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


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2020 at 08:22:57AM -0400, Sven Van Asbroeck wrote:
> On Mon, Apr 20, 2020 at 8:15 AM Mark Brown <broonie@kernel.org> wrote:

> > > +maintainers:
> > > +  - Jaroslav Kysela <perex@perex.cz>
> > > +  - Takashi Iwai <tiwai@suse.com>

> > This is supposed to be people maintianing this specific binding, not the
> > subsystem.

> That would be Liam and yourself?

I'd expect someone with knowledge of the hardware such as yourself.

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6dlL0ACgkQJNaLcl1U
h9D7Kwf+LC7/wtTT8Lua9SOMuqkJuV567Z2K+6WPBqGKZrXRPVgC6pof6F73yYHO
Khls/BtqPP5xrju44AZtEtwekL7nQc+cZ6OIOCjSBo5VzbFJH0PnBDfpXHHnptOS
DERuomhtelfPclJ5g1NKeeUxxo6yigRjy5PGtBslUB8l2orgGgA5K8oYJ3NYzX6K
PiJPjeSoaISIpeSBA4i68usuHBWWB3u4ys5gVEW0WceMjSUcUuacBQgCczV27Gnn
iwQ73fzp/q1TybKKnGJwbvgVpvsknh6l4T/Py603UBADklq7SMZIgawQFIoXkgUn
mYRYeBFdzoEiWpLgvH7C6iYNya9hug==
=rHE+
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
