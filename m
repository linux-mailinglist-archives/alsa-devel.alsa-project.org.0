Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B78AC54F5BE
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 12:44:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F2C81B42;
	Fri, 17 Jun 2022 12:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F2C81B42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655462655;
	bh=yT33ldFU3rebbAEBjPVl2UkmZ9uxE9nDsQERpI2t9lU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u1muPwpzHM8ZepdrV5Md03XcMpih+VuFWg3csjJ+B4S626Y8SSZ2DBvSHI1LfEzFB
	 KVxxbrM6RIy8BB9S6t0DI2MsHoHZ9Y4pX4dEYH/qg/W4lRnFLfbtFuRSscOc7Yqeu4
	 nHY9uDJdY10qdKSux6x6F600+eQuF1ASTwy3bjNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E19EF80528;
	Fri, 17 Jun 2022 12:43:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8509F80527; Fri, 17 Jun 2022 12:43:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A927EF800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 12:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A927EF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bdx1va0V"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1E0B2B82968;
 Fri, 17 Jun 2022 10:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DAC4C3411D;
 Fri, 17 Jun 2022 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655462588;
 bh=yT33ldFU3rebbAEBjPVl2UkmZ9uxE9nDsQERpI2t9lU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bdx1va0VaQIh0gxvFkKdeiiFbfXa3T0b+JeBy0oJzTaivbrMmS+D0PfDsHJdoSTQg
 2ysTTvtnPkcGrCtB8dVLefaKCHPFytXWFhB+76e63k9gDlJWx1Gr5TJckULV5lnrld
 2t2HnZ7aCSrwi8beAPSBdu17SYaecrUjjbzWHIfwktOap3CPn3xhnEPJ/GVCrMnZMP
 aV/NKzU4I/2yEbQ9k2H2Mbo+FwYOMj3j4yaqyqBlFeTxBU2prtl0yLfpCboSTMN0Xd
 +xtfgY/csMyT31WruFvag1vLsQHp/4vKy4y7uXDLzIBkDjdWiEa1RuDvuQ+kvSN/w1
 aNJyEpuLjiE5A==
Date: Fri, 17 Jun 2022 11:43:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Fei Shao <fshao@chromium.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Fix mutex double unlock in GPIO
 request
Message-ID: <YqxauLOp2sWOU/uc@sirena.org.uk>
References: <20220617100632.1447811-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jXPaouEK3FOmFDrR"
Content-Disposition: inline
In-Reply-To: <20220617100632.1447811-1-fshao@chromium.org>
X-Cookie: 98% lean.
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-kernel@vger.kernel.org
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


--jXPaouEK3FOmFDrR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2022 at 06:06:33PM +0800, Fei Shao wrote:
> The lockdep mechanism reveals an unbalanced unlocking on MT8186:
>=20
>   [    2.993966] WARNING: bad unlock balance detected!
>   [    2.993971] 5.15.46-421fef3b44d7-lockdep #16 Not tainted
>   [    2.993978] -------------------------------------
>   [    2.993983] kworker/u16:1/10 is trying to release lock (gpio_request=
_mutex) at:
>   [    2.993994] [<ffffffdcd9adebf8>] mt8186_afe_gpio_request+0xf8/0x210
>   [    2.994012] but there are no more locks to release!
>   [    2.994017]
>   [    2.994017] other info that might help us debug this:

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

--jXPaouEK3FOmFDrR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKsWrcACgkQJNaLcl1U
h9BEggf+NYEXEA4i95MJoX3RIZCLZsS6j2/wpgysgdDQZK0wcT2Jdy79DDrPIx8K
EQfqgLqIlxrdpjIJn0B3kIN1x6iczamii3Gd+h7odYHf7UWYgvSorSts5Jg0YLwx
Ze17TDN/kFiVmxsE0BKNbTEoSB9teKhpbM0z74xVsg2PMZ2sC/m/5IWPVgHcn/qq
mhjzVUfER075+eOTEaxV+4E9G2TypWG2GAjNrklf6J2Czg842Y0BnO/3Tk/AS9q4
RDigvbROs4g2+pUJAjsIcHhq1LqNf7yo8tSPIT4Evd+uN/AqddkXr166gcn+BOmX
BoRJF1AR869q0iJ4JoVS9xuzSXbswQ==
=v6CV
-----END PGP SIGNATURE-----

--jXPaouEK3FOmFDrR--
