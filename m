Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE94617DB7
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 14:20:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63B26163E;
	Thu,  3 Nov 2022 14:19:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63B26163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667481634;
	bh=BuzFgVLDFtoqSAjK0JxKChKYC74ESOfiK344WmhlBs0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ru1Re4mFVCxCFvzI+WwezUItXZdonwsW+Y2m3mCUlkTJlHHrOsmhCX+RUP23X0f00
	 E9mu6Ns78ky2lUv+a4qv5+RO7FXmbMZh5Yn8KlQvrNrwJWikGbMkm74diEaQfBU0qU
	 lphlKDd+t5HtiFfZqo+6/jHDhEpy0f5D2A3m56fk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3D55F800BF;
	Thu,  3 Nov 2022 14:19:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F6DBF8051E; Thu,  3 Nov 2022 14:19:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 065B1F80155
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 14:19:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 065B1F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S7a1iwfZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 63B1ACE2643;
 Thu,  3 Nov 2022 13:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1182C433C1;
 Thu,  3 Nov 2022 13:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667481566;
 bh=BuzFgVLDFtoqSAjK0JxKChKYC74ESOfiK344WmhlBs0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S7a1iwfZQBba61mRdG63bGG4QJsUQacG5kJ7yZuxfV1/mJIZ/YtkH7Fqf3tkLY6/E
 C83PebiEEKCn9WpcvXxaCt+TBU1RL5itTfjxn3oDr+w2y3wGqgqIEcK7mEWL7+Sxb0
 yHif8WVfMWse0X2mi5dpAygPcR3LsGr701kPZXx90by5M+SL0o0YMaPWTIs+UxV9nR
 8cSnMQ96XjID2zxddS5Onm0HNv0GEWJ1kT4JqmQgucNWMxLbrzEabxnvXAw2b+C7Y7
 lXea8XBJiUoTzn7nHoQ4iOsPBB4T5SxHvDJBKp9I4f5rML9ZM9j8xcPJTnrCBYXMn0
 0xcjCF6b96i0Q==
Date: Thu, 3 Nov 2022 13:19:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Jason Montleon <jmontleo@redhat.com>
Subject: Re: [PATCH v2 1/2] ASoC: rt5514: fix legacy dai naming
Message-ID: <Y2O/2bMGfYI+FStH@sirena.org.uk>
References: <87v8nwmgso.wl-tiwai@suse.de>
 <20221103131144.2942-1-jmontleo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="biX2K5PgICI5LQ8T"
Content-Disposition: inline
In-Reply-To: <20221103131144.2942-1-jmontleo@redhat.com>
X-Cookie: Dead?	No excuse for laying off work.
Cc: oder_chiou@realtek.com, cezary.rojewski@intel.com,
 ckeepax@opensource.cirrus.com, regressions@lists.linux.dev, tiwai@suse.com,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
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


--biX2K5PgICI5LQ8T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2022 at 09:11:43AM -0400, Jason Montleon wrote:
> Starting with 6.0-rc1 these messages are logged and the sound card
> is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
> it to function properly again.
>=20
> [   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
> spi-PRP0001:00 not registered
> [   16.928561] platform kbl_r5514_5663_max: deferred probe pending
> ---
>  sound/soc/codecs/rt5514-spi.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--biX2K5PgICI5LQ8T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNjv9gACgkQJNaLcl1U
h9Cq4gf/e5X5y8DxFwh3Oqy/up65HcmeYADpNz00eU8an3UbU9oiIgyHyp3Fx+Ba
bbZXaT3HqDypm5twHRpNn+sTiCNzqQ0fYwH+ku47E1h33DedHqAAmBLyEKX3BGDR
emkzS8EP4oML/gSsSppMIu49ZziNfVrUp9IPXF4ytUQb67mYd2xhdmVFOgZebOup
9u28Isow/2n4WGxt2JGGz9UPlSXGtmd3G+OjMkJrlp11I/JtY3u40AOIK/E53RBQ
iy1W7UJXo4HzgJa/pl4Mc9dNnDc4jhOKLpqBjFZq5UvTm5I2h2rYghukphtLEqjU
8IG8ng5X0GgzoreHuhntlBH/d9KfOg==
=kNLR
-----END PGP SIGNATURE-----

--biX2K5PgICI5LQ8T--
