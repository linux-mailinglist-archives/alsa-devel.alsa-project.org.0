Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 154EF4B584F
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 18:16:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FBC71939;
	Mon, 14 Feb 2022 18:15:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FBC71939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644858974;
	bh=uqZPAq41bwT8UMuih6L0D4Bw3u2/MvMTHK9+cuzgHUM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qK8vd4GFpK2/ZqNzXARBSwgsFD9nJ0/rUbsVKMuIvQQ3Cbt0gYXA4ZD+5pH0sIcXS
	 Ml48ozWRD7W4VazvHpkiLDGwNHv5qWDHv2dcj9agUq0BER1xcC1G8Q9Qtz5zzV0uu7
	 Igz/MiF7y8h1G8twxhnDlhF4YEXhmBesNMJr9znM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A26A0F804CF;
	Mon, 14 Feb 2022 18:15:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 420AEF80310; Mon, 14 Feb 2022 18:15:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3938F80169
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 18:15:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3938F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oUcAFmDX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0EA2FB80C6D;
 Mon, 14 Feb 2022 17:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1C6C340E9;
 Mon, 14 Feb 2022 17:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644858917;
 bh=uqZPAq41bwT8UMuih6L0D4Bw3u2/MvMTHK9+cuzgHUM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oUcAFmDX/DO0k//dCyCbPrMmovBC5i+ROtT7y1PlVhy+SYytwoOAvFrVvVVdL/H31
 cifMuOspuMcYYgqoE8z1rF6GIvQ0IKaVHFH4xLGCEpKjkfkr1VhpZZ5fAIWeBkEKpv
 GPYJj1coFgDiHt8iCzE5rNiSCFlrYq/AbOoKOjRHtxgy83zejelI0TJhOf3OXX+f1Z
 s9SpRatMrrz7awbhaJJD4R9/7RFiLMsfzGeQ7EXL9O6RgwG/ZiBNBowTTPSXsvQC5l
 4l+u2CxyJjTmmFp25Lc0BlxJZI+fAXGwqWluvWSFP4klSbAxFQOQlA1zm2FqZr4/wf
 KBJns/p7rgk5g==
Date: Mon, 14 Feb 2022 17:15:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: cs4265: failed to add widget SPDIF dapm kcontrol
Message-ID: <YgqOIVPaJk57iXn/@sirena.org.uk>
References: <CAOMZO5C9qqxLMA4Nw=YKvZth4_G-rMxCkOLOQ3a80nK8WWDURQ@mail.gmail.com>
 <YgqN5T3ObHvUNBKV@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mP8jQSXSzwRycgGM"
Content-Disposition: inline
In-Reply-To: <YgqN5T3ObHvUNBKV@sirena.org.uk>
X-Cookie: Am I in GRADUATE SCHOOL yet?
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
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


--mP8jQSXSzwRycgGM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 05:14:17PM +0000, Mark Brown wrote:
> On Mon, Feb 14, 2022 at 08:13:02AM -0300, Fabio Estevam wrote:
>=20
> > asoc-simple-card sound: control 2:0:0:SPDIF Switch:0 is already present
> > cs4265 1-004f: ASoC: failed to add widget SPDIF dapm kcontrol SPDIF Swi=
tch: -16
>=20
> > SPDIF is not used on this board.
>=20
> > Would you have any recommendations for getting rid of such error messag=
es?
>=20
> The driver is just plain buggy, it defines both a regular SPIDF Switch
> control and a SND_SOC_DAPM_SWITCH() called SPDIF both of which will
> create an identically named control, it can never have loaded without
> error.  One or both of those has to be renamed.

=2E..or they need to be merged into one thing.

--mP8jQSXSzwRycgGM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIKjiEACgkQJNaLcl1U
h9BMlgf/a9oZtxtISm7l9tNsUZyyiiHFRfGKx0sBGG5btCN68Yj4trVdhn1n5cia
n20YAlc5KazSoDYbPLt6n5yYjzoAIUyoGCIlm+ySNPYLtXjBnowzd8OpmTpnAyda
8NDlu0CdGHn65frzSYBdpO8f53ixxmUt7NYYwsLVCtCSOFB1riIq98e76E7u+zPA
qBXdrzM372ieLUQ2soHWcFCDxfshcYH+fIcefrIZJLEEheOXUVu1fzwNY3Jqlk7G
Qkiikiudya3poYT4G4C70m1HxbvFy2Xa9FxstYu14uobrFW/bFxdTrgfJAoCnVUD
3LVdgdEgN8MFYxNyMoTZcoAnr/RjQA==
=RcnL
-----END PGP SIGNATURE-----

--mP8jQSXSzwRycgGM--
