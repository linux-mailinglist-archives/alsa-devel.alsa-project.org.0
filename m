Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D111E171E8
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 08:47:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 323FE1843;
	Wed,  8 May 2019 08:46:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 323FE1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557298062;
	bh=lmZvA1xi8b2Et7FpZ58tOQ9y2JBHvjhfcvPbWV9x87E=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uPwuQRldmS8pu7JQx57Z2Mb3+NB4vv2T/npvGsMXqFOK5EFKoyuz2kAi4TVISVPso
	 8YDe42ei1zvRxltsnphy6SDsdukwwBQ27VhzF9LKZsBEqwZ2ALFyL59OBk67K5fY76
	 R1YBZi3ZdTmiYyGSuTatjC3WH0WspvO72KtxO+Xw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8AF6F896F0;
	Wed,  8 May 2019 08:45:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63CB7F896F0; Wed,  8 May 2019 08:45:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB967F8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 08:45:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB967F8075E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="CWxuF0YV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/kf2ADrsRyFouJKye0LLl6qk5FPex0e3t/hBjFFkrCU=; b=CWxuF0YVxk1yndZ2ZAnROeS9C
 nvmayFbDPtl8q383qmUmHWKo1S2OhTiAagpMFmbf51aKlsupD9d45A674ps3KvVLoUaYyH9gpvA6b
 eIK7o7UrypKrkU38ZFQTZcFt3XAQGE4e2/4vL4UpxVO5kE+WlgbRPpy5Eew06Kl3U49AM=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOGKk-0007AL-KR; Wed, 08 May 2019 06:45:43 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 1A97144000C; Wed,  8 May 2019 07:45:37 +0100 (BST)
Date: Wed, 8 May 2019 15:45:37 +0900
From: Mark Brown <broonie@kernel.org>
To: Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Message-ID: <20190508064537.GN14916@sirena.org.uk>
References: <20190416022246.10121-1-derek.fang@realtek.com>
 <20190416153510.GE4834@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B8280116192E@RTITMBSVM07.realtek.com.tw>
 <20190417150518.GB5703@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B828011660AC@RTITEXDAG02.realtek.com.tw>
MIME-Version: 1.0
In-Reply-To: <BC6F7617C38F3E4E8CA887E07B35B828011660AC@RTITEXDAG02.realtek.com.tw>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Albert Chen <albertchen@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1308: Add RT1308 amplifier driver
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
Content-Type: multipart/mixed; boundary="===============6181793911783392965=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6181793911783392965==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rQj5ySmgPRE3FKMj"
Content-Disposition: inline


--rQj5ySmgPRE3FKMj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 01:39:59PM +0000, Derek [=E6=96=B9=E5=BE=B7=E7=BE=
=A9] wrote:

> > On Wed, Apr 17, 2019 at 11:40:28AM +0000, Derek wrote:

> > Please fix your mail client to word wrap within paragraphs at something
> > substantially less than 80 columns.  Doing this makes your messages much
> > easier to read and reply to.

Please don't ignore review comments, people are generally making them
for a reason and are likely to have the same concerns if issues remain
unaddressed.  Having to repeat the same comments can get repetitive and
make people question the value of time spent reviewing.  If you disagree
with the review comments that's fine but you need to reply and discuss
your concerns so that the reviewer can understand your decisions.

> > > > The ones here with comments look an awful lot like they're system
> > > > specific config which should be left up to either platform data (or
> > > > DT/ACPI configuration) or done at runtime (like gains).  Some of the
> > > > others like the pads configuration might also fit into that.

> > > We don't open the DA gain setting for user at runtime, so have to set
> > > a default level in the init list.

> > That's not the way Linux drivers generally work...  is there some techn=
ical reason
> > for that or is it just some kind of policy decision?

> Maybe I could add a gain control for the user and set the gain to safety =
max level in init list for speaker protection.

The maximum volume can be limited with snd_soc_limit_volume() but if the
limit is for the speaker then that's machine dependent anyway.

--rQj5ySmgPRE3FKMj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSexAACgkQJNaLcl1U
h9Ce3gf6A8IJRSIzjna/z/sBSwfgjCYef/wy6qNfyOI2SiYcD0f1LXUkazcQJEMx
85zW3YlLLYExDQgYSxGILENwhOUPWmur1y+8z0tqxTMMUcMq7nHaOMczKG+SgPEa
WFKf2VSgLJogCxQ9UKdDWxzNSzSTwITkPoosiuVaSiacppik9RLgQLyI3aBBqfvn
AIP90oh1sebFUdTsAryvnIJ5F0xnPWw2Pf6jur+iUZK4qOyetLXvUu39GxiRtO9n
GZv3y/7hdgk3dLBNNZSyP6X+7tgbgwJb9U9GouNy/X0OoUEwgV1VlVUtjUdN92pr
c6rkIWF+7HIL4kRWUYZ7OVN/rSZzcw==
=y9wN
-----END PGP SIGNATURE-----

--rQj5ySmgPRE3FKMj--

--===============6181793911783392965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6181793911783392965==--
