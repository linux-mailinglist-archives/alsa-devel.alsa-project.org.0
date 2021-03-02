Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F0A32A785
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 18:15:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45094183F;
	Tue,  2 Mar 2021 18:14:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45094183F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614705334;
	bh=rTa+VFMAdGMoFocARiaHSEJ8fY06Ra7RcO+lNs2jNXU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=olUYVDo0soxBVZVqsmtXn33DiyNR1Nmx3dh5mqluhh+EAp/ZBspwcTXPL8TozsomD
	 h3f4UGMQt0VNLfWJoM+yDYy55J4/0tBxT1G12gA4Vo9XyIHLNRHXay5hiQqpb7cma5
	 s0qM0UtrZ3i2uePahWzrtTiPnba5YpSj7ehs18gA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D1B3F80271;
	Tue,  2 Mar 2021 18:14:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C62BF80088; Tue,  2 Mar 2021 18:14:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,TVD_SUBJ_WIPE_DEBT autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AE50F80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 18:13:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AE50F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mQ/OzDT+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D05F664F23;
 Tue,  2 Mar 2021 17:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614705237;
 bh=rTa+VFMAdGMoFocARiaHSEJ8fY06Ra7RcO+lNs2jNXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mQ/OzDT+b7dShEf/PIDOh13OgJoQyXN0RZ9nYKUZgJ4Lnnbn8dGFKL3BJLkuPmfDl
 d6PxsAwIPwbbHvNvkOFnzqUu+BAc5tGg8Eqa1Lh1bTRvN0AbneHOanvqs7STcj4jAt
 9PzjFFn4LWF6CjEPjNHXrPROUGKh3lZak2afQNaH7aHHDNYtzyTtXLMBN66mvhCyho
 ge7BsaSZAzbz6HRm0nvMQSvyZgzuAIuqIndmMHQ1lhyjlj08rKQMKFoBTmyG9Uf2HF
 B+7/tZShZVnQue4BSD8PkTxWe0T+QYIv3gbUv5xcC7IhTyAxXW4bXycpobSJMiRnSe
 OBqgU+Wets9HA==
Date: Tue, 2 Mar 2021 17:12:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 03/15] ASoC: cs42l42: Remove power if the driver is being
 removed
Message-ID: <20210302171250.GO4522@sirena.org.uk>
References: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
 <20210302170454.39679-4-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1y1tiN5hVw5cPBDe"
Content-Disposition: inline
In-Reply-To: <20210302170454.39679-4-tanureal@opensource.cirrus.com>
X-Cookie: Friction is a drag.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>, linux-kernel@vger.kernel.org
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


--1y1tiN5hVw5cPBDe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 05:04:42PM +0000, Lucas Tanure wrote:

>  	/* Hold down reset */
>  	gpiod_set_value_cansleep(cs42l42->reset_gpio, 0);
> =20
> +	regulator_bulk_disable(ARRAY_SIZE(cs42l42->supplies), cs42l42->supplies=
);

Are you sure the device is always runtime resumed on remove?

--1y1tiN5hVw5cPBDe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA+chEACgkQJNaLcl1U
h9ATtgf+MNQsl9DYDnA0IuhXNX2UYO8ULD6URRUWSQVUwauxN/xqFUhK/7QkRhbv
+uc58aCIkAOTNnd476FGA34BwivjGOt2M6QSpgYywV79rh0zSHaX1g25S8Mbm9I3
arknamPvzPz6hcU9KFCl4zlfhJsUosEuvYmWeUqxrFNUiuYeHjgS56vOVBSatD6z
GXEccn3VXpV395tMc2Sp8lUJpZ0RwKdKs1BG5weoSQgDpRiViMweIaLnSUaSUFp5
FB/o91xSAj/NVTkPOGZA9Xcj3rZzQ0VSjE3I/FFvh52QpIQstsTgqn/5TKRunKWD
u5g8WGYF/S+1q86m4bpHyShOseqGnw==
=Re6y
-----END PGP SIGNATURE-----

--1y1tiN5hVw5cPBDe--
