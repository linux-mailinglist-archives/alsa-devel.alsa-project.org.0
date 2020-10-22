Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD048295E04
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 14:07:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EB5C17C4;
	Thu, 22 Oct 2020 14:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EB5C17C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603368473;
	bh=t+X/fz+JfWcR2EunKKVuaJPpOA4TjedvNGMrxIpej5U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f4A7Mn9FEsCtqXYuiH4TIyr5Gy21fFl7LmDBQN28jbBucSyUgNQIxSUAGu/G+MmoF
	 Y0pbh938qA72DQJZqdZgzNqjhdsOIqQ8kG0ih7LjE1kEozdCqa7Gc/f2yHEi5usSJ1
	 8FlaUqsvYr+MkGo5FFE+Zx+5PJxBVTRcgMEesuM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD029F800CE;
	Thu, 22 Oct 2020 14:06:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6141AF804A9; Thu, 22 Oct 2020 14:06:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDF99F80247
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 14:06:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDF99F80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="E4Y4GTYO"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A441C221FE;
 Thu, 22 Oct 2020 12:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603368368;
 bh=t+X/fz+JfWcR2EunKKVuaJPpOA4TjedvNGMrxIpej5U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E4Y4GTYOPdmpu+/ow4kGpO4WqSwMFJB/JM+AYpGMSMnsPEGbpwWkDYYEM3oY/NsRL
 k2q6jz57MFl1cwOa86eGIVfCtsjMmUUvPe4Lx0k+JqiNEAkt2BgkRW68izrBXw/WR6
 9I5yT2TWdP6XkATm8b/dS7Nw0BQUAzXZMWLH0zm0=
Date: Thu, 22 Oct 2020 13:05:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v2 2/5] ASoC: mediatek: mt8192: add platform driver
Message-ID: <20201022120556.GA4826@sirena.org.uk>
References: <1603270435-3548-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603270435-3548-3-git-send-email-jiaxin.yu@mediatek.com>
 <20201021132339.GF4497@sirena.org.uk>
 <1603361084.8921.26.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <1603361084.8921.26.camel@mhfsdcap03>
X-Cookie: Some settling may occur.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com, tiwai@suse.com,
 tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2020 at 06:04:44PM +0800, Jiaxin Yu wrote:
> On Wed, 2020-10-21 at 14:23 +0100, Mark Brown wrote:

> > This is *way* too big to be a single patch, please split it up - it's
> > over 600K.

> I will split the dai driver files as a seperate patches. Such as:
> ASoC: mediatek: mt8192: support adda in platform driver
> ASoC: mediatek: mt8192: support i2s in platform driver
> ASoC: mediatek: mt8192: support pcm in platform driver
> ASoC: mediatek: mt8192: support tdm in platform driver
> They're still in series of "ASoC: mediatek: mt8192: add platform
> driver".=20
> Is this appropriate? Please correct me if there is any misunderstanding.

That should help, yes.

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+RdZ4ACgkQJNaLcl1U
h9BFaQf+L3FRqaz4A2QbQxIofXh6aZaoYBnbTRNNHq9tK52ZNoBuo7c5Oq5jdDxU
Vrp2Lrp2/5zPc3t2ejKzfghfdaExq0CI+3HhZyy2rpD7DorFI9hhUoMEEy0HeDD2
OObHcIoDeTTQyTTGmTfQ4ii5+pgfNvxbmId1wYBUD4T/3oY2d1ZV9USUCxavMzRy
IhMQabPIRTnOitpCtk8fpWUEzz/2t9vDWFJOTzuUA/wyzPjQ+6oMX1YS3op3n0Y8
GS8Xh70JKZ/tJA4wpprIwovx6dwS8qxs17YvvZSIIopzxlZHbsbZzJpUFdbbF2E1
s/vPkaVt6maR2dVRk2afz3FWPighSg==
=jh/Z
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
