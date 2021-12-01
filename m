Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0684465172
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 16:22:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C94224D2;
	Wed,  1 Dec 2021 16:21:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C94224D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638372162;
	bh=D58/6QGqnnVxmXKUhpKUqCmH6MS+vp6LBDiBbA6uGo4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T/8pems0Cv38Yc6cXw7VvvIRd+og7D8aiBZRNhiEnztRdEyIE77lSRt9xz2oB0BbJ
	 yZ/LgzcNhkv+eAWOEdRfmkJKJKjR5HFgVBgZRQgFcVL0uKvekxsurOWn4eqUqTBqvx
	 PUbu4cMb7FUk8GcFpUDuOob4EzKLe13/g0BZg4rE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4B1EF80249;
	Wed,  1 Dec 2021 16:21:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3154F80246; Wed,  1 Dec 2021 16:21:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04AFAF80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 16:21:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04AFAF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kl3KRwAS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 27583B81FE7;
 Wed,  1 Dec 2021 15:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DA4C53FCC;
 Wed,  1 Dec 2021 15:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638372077;
 bh=D58/6QGqnnVxmXKUhpKUqCmH6MS+vp6LBDiBbA6uGo4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kl3KRwASmPVgL/nH9VPiSPynx1Xer46raq4kVVmFWUlE0gT/0QQjnOyHu6W6OwJoa
 8Tj2wjSwFC20fS9vckRQpGCL1LF9layRWja7gSg/JgiuPSPOPOucN7RJ7T5vnFbMU8
 UxEUcQ5wPTNfGJ3ZTloSPE9qlV9OQIQvDmWiKCoe/AEtnb61KcdImhEQL/U4WhBiDP
 ePld6PO1bkNQPehzLrWfT7hHkOIa8/3wUtH84JvmLwDpHlVVELgNvSmFMaSWQUBsTo
 tJbN2C6zRcW5o80SpqMd2LzS2wD3JHsy7ybHOh3RvUUKGRhVr4Q9ElD0gsMpDiEyjF
 AlX4qUeFreRBQ==
Date: Wed, 1 Dec 2021 15:21:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Ricard Wanderlof <ricardw@axis.com>
Subject: Re: [RESEND, PATCH v6 1/2] dt-bindings: sound: tlv320adc3xxx: New
 codec driver
Message-ID: <YaeS6WqKNRpX2IGs@sirena.org.uk>
References: <alpine.DEB.2.21.2112011603080.30606@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="E+YjiY8Ir+JvjXPZ"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2112011603080.30606@lnxricardw1.se.axis.com>
X-Cookie: All true wisdom is found on T-shirts.
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--E+YjiY8Ir+JvjXPZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 04:09:17PM +0100, Ricard Wanderlof wrote:
>=20
> DT bindings for tlv320adc3xxx driver, currently supporting
> Texas Instruments TLV320ADC3001 and TLV320ADC3101 audio ADCs.

I realise that the threading is broken on all your patch serieses (it
would be good to fix this) but please don't send isolated patches from a
series separately in the middle of pending review for the series, it
just makes things even harder to follow since now there's two different
groups of patches and they're not even grouped by sending date.

--E+YjiY8Ir+JvjXPZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGnkugACgkQJNaLcl1U
h9CoPAf9GtGPHt7BObhWyxMnKRZn9j9gDytFFXLfrfAokadiEtMvEz4mkmLht4lD
mmb18xtiFJayuJHfZF+ExMIKPtDq1jzJx4KKKrhDUUSy+lVQp6VHnEcWbtfsVWVz
4wxxDgx5cGQtKEBTe1WQOA3Sk0gyEmKf+E5fbeoqf1R+Us0727zovObWBXwtvSuj
FL8DMSnUCPyby895QzH2eRK0O7wisLZRN97wU4kiIUEwihrGx8vu8d0p38fwg62U
IHt9lsq79dosqWjcK56dhNdRHPe6y43AlmYHzItJJ/kI7bHKR+OCm7Wxj86pRRvv
u0X+ImSUACqr48IccSWVwkg2/1KIMg==
=du47
-----END PGP SIGNATURE-----

--E+YjiY8Ir+JvjXPZ--
