Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D501ABEC9
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 13:08:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7916A1660;
	Thu, 16 Apr 2020 13:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7916A1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587035314;
	bh=hoZ9QGqcxHmmiuNc3WuaB3P/uIKPx/orsRJqNPr68EA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TX9ngFgf23HfNaQ8qb3jv7Vqc85lPmxgH/t90Rmz94If/g8J6qoNGBPPS06tGvmhD
	 nS9LA/iEHvCR4TWJtyDGEJqyL9G18m2qOKZdd7dUUiZeGIhfWy+3YJ5U3DTxFMNmfq
	 ixVISq4wxv/KXAnKYtMkWSGjZAwaE46TLFJWoRtA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DA10F8016F;
	Thu, 16 Apr 2020 13:06:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47DDDF8014E; Thu, 16 Apr 2020 13:06:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4884F80115
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 13:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4884F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fQQMCJtE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D727208E4;
 Thu, 16 Apr 2020 11:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587035206;
 bh=hoZ9QGqcxHmmiuNc3WuaB3P/uIKPx/orsRJqNPr68EA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fQQMCJtERWG/TM9BGUSmZw1U8kXmZPf9eTAjyoAUA1dXanIyFpOABdwXvqwb4Ate0
 O3DIQHNmIV8u3Oeu9OzHdZqDALPFpY9uv/njT3K1Nvpt18vxNf4CdQNdUb3St9mvzH
 gXHLSqB7tsv1jUnNOXJaxfETsuUScAFz0HExQtn4=
Date: Thu, 16 Apr 2020 12:06:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 1/3] ASoC: codecs: hdac_hdmi: Fix incorrect use of
 list_for_each_entry
Message-ID: <20200416110644.GF5354@sirena.org.uk>
References: <20200415162849.308-1-amadeuszx.slawinski@linux.intel.com>
 <20200415172513.GI5265@sirena.org.uk>
 <af6087bd-315a-43f7-e283-1b35ec48cdd4@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="juZjCTNxrMaZdGZC"
Content-Disposition: inline
In-Reply-To: <af6087bd-315a-43f7-e283-1b35ec48cdd4@linux.intel.com>
X-Cookie: Tempt me with a spoon!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
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


--juZjCTNxrMaZdGZC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 09:27:29AM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:

> Oops, I'm sorry about this. There is only this patch, do you want me to
> resend?

No, it's OK.

--juZjCTNxrMaZdGZC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6YPEMACgkQJNaLcl1U
h9AXnQf/Ved91SzS8ytxhGzCP3X0jJbwoHvvLz+L0PLupE/FoJIbA5pbCCN6GkBM
S7THcoe4eLEZANxJmEPURByG1le/8dCD0L6GvJ5/b/fcRbgHWDNbrHRrM7KDOGgU
K+hJK+yd4C2MErHQDLPDuiOT4cgbKuW0VojAjFxYRiSdkZ819ufseqEnbqrtrial
CIJOT6GYZeVDC6vJ35Kg2HIZQK+tdvuh5L4mtTQ6Fa5xKP11x4HFS+K1s7iuAD+6
UXGwvk/fsfGS6DYsdjQdpLwz2OdFr+xIJd+nkPLvVY9cap21dwwQcA+vqm3hYjhi
P+pORr5ir5pnKFHy2jKJ1c8v4Nhn9A==
=2Kt9
-----END PGP SIGNATURE-----

--juZjCTNxrMaZdGZC--
