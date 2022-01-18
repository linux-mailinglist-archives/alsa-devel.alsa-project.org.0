Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDB8492B0E
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 17:20:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CB3D289F;
	Tue, 18 Jan 2022 17:19:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CB3D289F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642522807;
	bh=lWwgMLWeN92CpQV3rny+wqDTYoq0ROE6wIY4Y1P6dnA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VT2wTFllmBARvn5lIyzTmKdkXldXx7q9OCw9/bybmcz6ndcOna7O+x/MZWclly9cb
	 Q8apoNOTqcfkljHo9eaex9afVN/IV0pRL8yvzK7zkabJDffNkRSG9f8gSCjLEfyrsH
	 9DlynkJ6GCkz69SjS0UoBvUouQecsjR10eIi+nKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A5F1F80240;
	Tue, 18 Jan 2022 17:19:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 685F6F8023B; Tue, 18 Jan 2022 17:19:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 514DEF800CE
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 17:18:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 514DEF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jGyX78QR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 08EAC6143F;
 Tue, 18 Jan 2022 16:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6DCC00446;
 Tue, 18 Jan 2022 16:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642522730;
 bh=lWwgMLWeN92CpQV3rny+wqDTYoq0ROE6wIY4Y1P6dnA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jGyX78QRww/d16vaK9s1zbN4lO8EJ0FspYJdZgkvqR+MmqdU0SXHWhsxgJJUXzaN1
 lzFX8CPXjPCWy4dTQzGzSZmlLCFX+mgQ3HFFYtt5y/9Za1Gs8Nvp1rP5dEZ82iKaYK
 PBV5trb3A7sxfw4tquN/NsR54aWamu9CWFAxIlGV9n7ue0UFL6iBspe+pTmPFXuJzL
 ooJXNddznNMqWwdqK1BhGbCOtFdLH5WLoAfm+925oAuVu6bPHMTj37TaaUdFmSU8zu
 1Tz51eidlhe6gQZrDqZ4ERaHlMl4WwvKAs+I/FxcE7ZTFGUHOLr7aIap9o9aGt5ZhC
 0ubF+mQwQRyLw==
Date: Tue, 18 Jan 2022 16:18:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.16 50/52] ASoC: amd: acp: acp-mach: Change
 default RT1019 amp dev id
Message-ID: <YeboZaJQLVejZCRg@sirena.org.uk>
References: <20220117165853.1470420-1-sashal@kernel.org>
 <20220117165853.1470420-50-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q6NjtMl96wQVpgwI"
Content-Disposition: inline
In-Reply-To: <20220117165853.1470420-50-sashal@kernel.org>
X-Cookie: Do YOU have redeeming social value?
Cc: alsa-devel@alsa-project.org, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, stable@vger.kernel.org,
 tiwai@suse.com, vsujithkumar.reddy@amd.com
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


--q6NjtMl96wQVpgwI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 17, 2022 at 11:58:51AM -0500, Sasha Levin wrote:
> From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
>=20
> [ Upstream commit 7112550890d7e415188a3351ec0a140be60f6deb ]
>=20
> RT1019 components was initially registered with i2c1 and i2c2 but
> now changed to i2c0 and i2c1 in most of our AMD platforms. Change
> default rt1019 components to 10EC1019:00 and 10EC1019:01 which is
> aligned with most of AMD machines.

This seems like a disruptive change to be backporting into stable...

--q6NjtMl96wQVpgwI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHm6GQACgkQJNaLcl1U
h9Cc+Af+LysinIPtu2z7k6BtNNgMxopSjDRXmvpFaxTaDINJWKg0Qps9VjZIQoM4
46/b1AnkPLHJW48mtsS0chlzyIB7yvnmY+boA8WHntSxYInSmOXP4tLIw8X/Zq3e
E9UBjPxMYJbPxNNDR97PqEJP7K71maEWwg+hgwkS5O6HsztCWMfO7mW7zOAKidsN
8Kgi6OgkjiPdKs5eFr3bzR6KcK9x5gc759E8Ox4bHLUhDTRy1umZNo8CLxssOCTG
6AjrJCR0pdy3QsONDVh6qnbj5FXeQoj3Tio5INS+4VQVfsffCsa9sI6olp3qcGXF
aIBtW46qLwVqqyjDwhe1QwTVLULb3A==
=YylC
-----END PGP SIGNATURE-----

--q6NjtMl96wQVpgwI--
