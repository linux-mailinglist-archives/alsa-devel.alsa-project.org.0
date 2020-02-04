Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA4915185B
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 11:02:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A026D1693;
	Tue,  4 Feb 2020 11:01:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A026D1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580810547;
	bh=DO1V73RgRx3yUw8B/qALwps3+5HSgLGMabIvXGstFQQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X8CuZ11mFVOdWCfceLS2ZENizZ3UYU5ZHhvA+/KfffV2dCPEerQj2y1/0XmVNl+VT
	 8WOAmH/Zcwg2KDa6D4n5bvevgsCYB1Y3r1npSeQxsf9NClTwNqtkB076yDVxRzlJ20
	 UWYT5QTHi59VPeAUKMXTGccC0wOuBU8GijoYCCPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A1A3F801DB;
	Tue,  4 Feb 2020 11:00:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45E9DF80162; Tue,  4 Feb 2020 11:00:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DCB7F80051
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 11:00:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DCB7F80051
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FNpve2cc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ssxr3RN87YVt9erEY/AmThQqgJl7IC/HXQPGjVWT5dc=; b=FNpve2cc6sJHkS1nA8oRLmsxd
 t1E2xN4YDhZWy2Pqv+QVOWbhJfoocNsBM/hrWZ+rerZ3JhbwRi65s7x4w/wVd69LKrVMX5VueiTbb
 MOkdi1y2uQK0MFpBcWUmmMmLCQaEGmbDvQVS4qhrteHZQKccgf/TF2aobKvraWLnV+wQU=;
Received: from fw-tnat-cam5.arm.com ([217.140.106.53]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iyv0a-000765-4J; Tue, 04 Feb 2020 10:00:40 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 94AB4D01F30; Tue,  4 Feb 2020 10:00:39 +0000 (GMT)
Date: Tue, 4 Feb 2020 10:00:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Message-ID: <20200204100039.GX3897@sirena.org.uk>
References: <20200204060143.23393-1-natechancellor@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200204060143.23393-1-natechancellor@gmail.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: clang-built-linux@googlegroups.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: wcd934x: Remove some unnecessary
	NULL checks
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
Content-Type: multipart/mixed; boundary="===============8573692913544119018=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8573692913544119018==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ka8pmxPp9qZnI4DD"
Content-Disposition: inline


--ka8pmxPp9qZnI4DD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 11:01:44PM -0700, Nathan Chancellor wrote:
> Clang warns:
>=20
> ../sound/soc/codecs/wcd934x.c:1886:11: warning: address of array
> 'wcd->rx_chs' will always evaluate to 'true' [-Wpointer-bool-conversion]
>         if (wcd->rx_chs) {
>         ~~  ~~~~~^~~~~~
> ../sound/soc/codecs/wcd934x.c:1894:11: warning: address of array
> 'wcd->tx_chs' will always evaluate to 'true' [-Wpointer-bool-conversion]
>         if (wcd->tx_chs) {
>         ~~  ~~~~~^~~~~~
> 2 warnings generated.
>=20
> Arrays that are in the middle of a struct are never NULL so they don't
> need a check like this.

I'm not convincd this is a sensible warning, at the use site a
pointer to an array in a struct looks identical to an array
embedded in the struct so it's not such a bad idea to check and
refactoring of the struct could easily introduce problems.

--ka8pmxPp9qZnI4DD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl45QMYACgkQJNaLcl1U
h9Cf8gf8CZ7NH/RKF60fNu1KZA25wBAuUOMAzTNY+DTfeFpZorShbSWMtzL1fI52
FeYZWbk/WzCbrCWG5PQAT82GJT5qevp2Kyvm88/LgHROfRtzZpKV5f4dNnrqWiNW
xH0sw4D/gdLq3i4nJGfENO+cywG/6JvuwlOE9A5NdabBR9RzfAfuDNNtCxXuiyfq
lb25cFa262Q0uwXVrPmFOFFj/OaEA2K88IQl4sFc0SwKu5gr1W1P3K6p6Y+c1jOW
0fm32OI5+0MqzRi60nb8IXFgwsCr0rCqSeoNPjM9xnLNxfJV8HPYvuVwuo0SRBsh
h70U8U+kRSGnqm/VsF0vNVUKWdey8Q==
=9EMo
-----END PGP SIGNATURE-----

--ka8pmxPp9qZnI4DD--

--===============8573692913544119018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8573692913544119018==--
