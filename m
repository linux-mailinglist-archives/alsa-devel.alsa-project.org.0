Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9C926FB98
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 13:35:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE92816E4;
	Fri, 18 Sep 2020 13:34:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE92816E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600428949;
	bh=vM9m8zMv8skQhP1SU9+eBixGXC0EckzK9yvz6NaUPos=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TffVvxBscH7W0M478LZD6HfSm3neURR/inQHBrDgVShC+9SonAXKgclLe5c7wrPKh
	 M4cbFayii6Ts49O5zec2rrltIjLdO0X7WSfAcO6kQ1CPhEJuNAGFbwhINHLEGF3eqD
	 He2KzEpCGOqt5pDptto/JkqX7IlVrAH14um5DPzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2E03F8015C;
	Fri, 18 Sep 2020 13:34:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C137CF8015A; Fri, 18 Sep 2020 13:34:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D593CF800E8
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 13:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D593CF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WqJF40Tm"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37D5D21D92;
 Fri, 18 Sep 2020 11:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600428836;
 bh=vM9m8zMv8skQhP1SU9+eBixGXC0EckzK9yvz6NaUPos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WqJF40Tmbbcu+C86lBB7op3aPDfPdDDNQHgJduS0lK7NV0+/M2mK5VtUKFsq1DlaY
 n2vKuezl/0GFAbDez20C6P+qIKNoogzhinJEn7/cFAK/8PPJMdyIhzIVSAuT7RdhII
 R4nGgHAha7ASK+jT6y9v54+fR5nJhOnvr7rLRKn0=
Date: Fri, 18 Sep 2020 12:33:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Camel Guo <camelg@axis.com>
Subject: Re: [PATCH v4] ASoC: tlv320adcx140: Add support for configuring GPIO
 pin
Message-ID: <20200918113305.GF5703@sirena.org.uk>
References: <20200918073229.27348-1-camel.guo@axis.com>
 <20200918111823.GE5703@sirena.org.uk>
 <b5cc9041-62ea-d578-db28-c1ab8ec50842@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+jhVVhN62yS6hEJ8"
Content-Disposition: inline
In-Reply-To: <b5cc9041-62ea-d578-db28-c1ab8ec50842@axis.com>
X-Cookie: Beware of geeks bearing graft.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, kernel@axis.com, dmurphy@ti.com,
 Camel Guo <camel.guo@axis.com>
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


--+jhVVhN62yS6hEJ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 18, 2020 at 01:27:50PM +0200, Camel Guo wrote:
> On 9/18/20 1:18 PM, Mark Brown wrote:

> > This needs a DT bindings update for the new property (I thought there
> > was one in prior versions)?

> That patch for DT bindings has no change at all. Now I resent it anyway.

Any patch series you send should be self-contained, if some patches from
a previous version of the series are unchanged you should still resend
them.  Picking some patches out of different versions of a series makes
everything less clear and more error prone.

--+jhVVhN62yS6hEJ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9kmvAACgkQJNaLcl1U
h9BZXAf5AWFad5ytUdPcfO1yq+1w7pPVigXPZmUPIlAbUtoJZj8aKGqd7s70o3sg
/kVqkaqO7VglpPveiJ5cI0KrJR/tyeWVgUxxJD6nrxoCpSy9Jkv/V/NKTd2TN8QP
AyMszQLMadRdzOqi7W96k93AuWrlIpU1ZmzW5Ud+RXrvHtSizBbuK/TtYSBsPOVP
7uqOPI+sUVRChPDVPflMa6XoaOvfRDdtUZibhVWhDWkaeathOpn6AnN+mJwKd9PP
jila+Bcx2NPVKmUMu4nVS9bWhkszwMRa1vSVCXfJa6fiBHI7LynKkrEaZIfNs+1Y
4LXZzgYnJv7ARd5iB4AnW5dJuJvTow==
=1OzC
-----END PGP SIGNATURE-----

--+jhVVhN62yS6hEJ8--
