Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7BF27700F
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Sep 2020 13:38:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CBDB17C4;
	Thu, 24 Sep 2020 13:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CBDB17C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600947480;
	bh=vrpSuqvVzAK1dx5iKkbuD69vckGhYgul1IbPza8L41s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xg3Z9sic5L5UrilE9sqlTULVB7KeZKWXtrmEEUco8XGsAtpqdm90t/zMKuU9xZPuJ
	 iPTI19zS7JPpeP6hWCKhSgbCinjiO1Sp/wAVJSEitmz+fbBcIbAd2nX5soXuiMvB08
	 AAfhpi8jWHS6oq5qQ5M6l3DQGjpRNkpuPOZKshEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27AF5F800DA;
	Thu, 24 Sep 2020 13:36:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 513ECF80232; Thu, 24 Sep 2020 13:36:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3584AF8015F
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 13:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3584AF8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KAKqrKbn"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76CBA2220D;
 Thu, 24 Sep 2020 11:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600947363;
 bh=vrpSuqvVzAK1dx5iKkbuD69vckGhYgul1IbPza8L41s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KAKqrKbn9i3r6IrK44akQRuZr2/30WG+W/Rs354V+9Hm5pbjvY+0AmzYsxYQcjq6o
 NQKAZcl3W7OUe1CyzzD6jxAlZVFS6p9xOnsgwKl0a5wepxm7HjW/FrJ6GZFCgDG5WK
 51MvZdeB/cCfh66TucPG79zLu4bfSQzvRAMqCWuo=
Date: Thu, 24 Sep 2020 12:35:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: SOF: fix kcontrol size checks
Message-ID: <20200924113508.GD4754@sirena.org.uk>
References: <20200921110814.2910477-1-kai.vehmanen@linux.intel.com>
 <160073312817.6173.14263034136602358389.b4-ty@kernel.org>
 <alpine.DEB.2.22.394.2009240841280.3186@eliteleevi.tm.intel.com>
 <20200924105645.GA4754@sirena.org.uk>
 <alpine.DEB.2.22.394.2009241426320.3186@eliteleevi.tm.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2009241426320.3186@eliteleevi.tm.intel.com>
X-Cookie: Programmers do it bit by bit.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com
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


--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 02:30:23PM +0300, Kai Vehmanen wrote:
> On Thu, 24 Sep 2020, Mark Brown wrote:

> > Do those patches actually apply to for-5.10 or are they correcting
> > issues that only exist in for-5.9?

> yes, the series was based on broonie/for-5.10 for sending, and I tested=
=20
> again and both of the dropped patches still apply on top of for-5.10. The=
y=20
> do not apply cleanly on top of for-5.9.

Well, that's the only thing I can think of - that git thought they
didn't actaully have any changes in them when it tried to apply them.

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9shGsACgkQJNaLcl1U
h9As3Qf/TRo+vcvCLsqiCBegyq7fpbe7NYFn25Yd2MI1qTfMQCqNwuV5+HxLyQtN
KTlKZQsqhMOrcrIrHZE51p4D4lm0s6CyRvDivLwXXaSGea7W+8vFfQPwGAUwKYQB
WEovBjTTRmFMvfaNKaJnZuqF5RO45OWf9ZKeVbxMuM5DgtmXlC4esDfg6xdUT7X/
E1qfii+gkR1x8qbs6OTnaeeR8P9BOzIsJc2SHC8W7Yi8D6TNZEBVGn0qL1QqtRdM
7YwMwpBc6+AWdlOznR2bUYtKZ3j2SwaePd9LAnWHeoR8ltscQ1tlsLs+FUiBzkLm
mljP1maxIw48SOFL9O+2UiiflK9nuw==
=Nv+E
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
