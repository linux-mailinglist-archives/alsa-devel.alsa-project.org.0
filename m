Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EC3299A3B
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 00:12:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2186516B0;
	Tue, 27 Oct 2020 00:11:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2186516B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603753956;
	bh=+rA3mXse0duYebj29NlP/iv4vLfme+C3PEBv33IDzrs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=umdOD6kRNxdic3W/uDgBvgMi1/omZTCDsmvaW2jGJe/iRQiRIBqOzUOeQQw6UadQ1
	 OjJRjId/QSLtPZpgqgdY+S6OfuqT3E5J3yvLRnNd46QXdavrQR9MS5cG7JTpRhQ2I/
	 73oE8zJtB5R7caaZuFwFWMFB36kxEfcAuUBnIzw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2262DF80249;
	Tue, 27 Oct 2020 00:11:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2692F800CC; Tue, 27 Oct 2020 00:11:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D515F800CC
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 00:10:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D515F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qHjp+5jr"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A32F20759;
 Mon, 26 Oct 2020 23:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603753856;
 bh=+rA3mXse0duYebj29NlP/iv4vLfme+C3PEBv33IDzrs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qHjp+5jrlZUjjS4s9kch5YsSP5uJuL32CjMBRUGnmzQsCPbIQTMYiby7XugKM1gVy
 Ef6vxvWkE8+t6r+VzMiqZ0YCq6Yoyhp3g4IouKpfw+h+BpJSFV8B8oodDAOh6K6xrs
 3kSvxOS/fL+4dkwOH1wyjxOMiX5KPtqSOp+x770Q=
Date: Mon, 26 Oct 2020 23:10:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH] ASoC: Intel: kbl_rt5663_max98927: Fix kabylake_ssp_fixup
 function
Message-ID: <20201026231051.GK7402@sirena.org.uk>
References: <20201014141624.4143453-1-tfiga@chromium.org>
 <20201014190226.GE4580@sirena.org.uk>
 <20201026222747.GD2802004@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="T4Djgzn3z2HSNnx0"
Content-Disposition: inline
In-Reply-To: <20201026222747.GD2802004@chromium.org>
X-Cookie: Safety Third.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 =?utf-8?Q?=C5=81ukasz?= Majczak <lmajczak@google.com>,
 cujomalainey@chromium.org
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


--T4Djgzn3z2HSNnx0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2020 at 10:27:47PM +0000, Tomasz Figa wrote:
> On Wed, Oct 14, 2020 at 08:02:26PM +0100, Mark Brown wrote:

> > Please think hard before including complete backtraces in upstream
> > reports, they are very large and contain almost no useful information
> > relative to their size so often obscure the relevant content in your
> > message. If part of the backtrace is usefully illustrative (it often is
> > for search engines if nothing else) then it's usually better to pull out
> > the relevant sections.

> Okay, I'll trim things down next time. Somehow I was convinced it's a
> common practice.

It is unfortunately far more common than it should be but that doesn't
mean that it's a good idea!

--T4Djgzn3z2HSNnx0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+XV3oACgkQJNaLcl1U
h9DHEQf+P9XM66VGrpm7CJvgSRIOiFF94Fk/gQFsulGNkv+W9YcF+z4wsrEsR3kh
5bZuxRsp06aabr2ESWJ5pwQzMyH5q8E4Ou7UhOBxJHzBqr6imfzshTm/1X+4Orq2
tlkrkSxHdJt7Gm9/joTRrzs5S7agkKfRZKZdSpIN2ve5ztRqKL5tc310LMAwyOJF
k6pezKd5Hb9ds7zWQ/yHMCTi/AUzPB9aPwI0nq5tgWbndsZ0hgSCI1Ze1gi05v/d
y7jKlPQmYP5hvWRDNqsXx63M1jJKsh40+it8XQnxuaFG8k9kd9s8lGifmAGBEraE
RBYD2VOBrziPtYW2uH3IT+G6xbSy3A==
=oJS/
-----END PGP SIGNATURE-----

--T4Djgzn3z2HSNnx0--
