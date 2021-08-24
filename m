Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1183F676E
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 19:34:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9821167D;
	Tue, 24 Aug 2021 19:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9821167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629826471;
	bh=mej/64pLiWPy5SBG4SNrzb7oaUPDF0mj87Idam/NBcI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GQoqSWz3OJrPUI3wEaCDCtv/BiDTmne/6+J0uA7Zy3fIOxqFrBh1u0SjVlGvLQAsZ
	 tuagDYV7mvphASyg1X6zvRQm/kjIzkEkErbMHIwx7TaNGhsuApvqThFUMGcpG1k3jv
	 cd+axTC5q5+cAHxMrLnpjcmi26doo09W7EjnfQMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41060F801D8;
	Tue, 24 Aug 2021 19:33:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65807F801D8; Tue, 24 Aug 2021 19:33:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35128F800AE
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 19:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35128F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VoZT0Zr8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06F28610E8;
 Tue, 24 Aug 2021 17:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629826384;
 bh=mej/64pLiWPy5SBG4SNrzb7oaUPDF0mj87Idam/NBcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VoZT0Zr8v3ZYy5iaPeJt5/5Nu1rKmJ5eFkvbh78HTWP4Y1O6PM5ihHVp34q638Tsn
 1DSAjy9xkz2snU8h3Cyl7yCQgU7dTbrjmzUeqS7aFw+KprZ0MSQy7UsqGKC/OLRT14
 jarR0sHuraEB0J1C23s+M+Zr6j7RDrOBTk3HEE3SRcp7xDfWbagOu8l0DRAWQoV31S
 Dbd7Qqs5HXwC7Edit2HeVgqVRShTRyICxQjm4J+oePVgQ35QdsOFG3+3kbVenH9rJo
 ep8Bu/WKowkgyab7eL3zO/Ykf7JKRA63NUy6ivd04w897umnrrCTStrXFoeEliu4eO
 On0IVkvLM1KZw==
Date: Tue, 24 Aug 2021 18:32:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: nau8821: Add driver for Nuvoton codec NAU88L21
Message-ID: <20210824173237.GM4393@sirena.org.uk>
References: <20210824041647.1732378-1-wtli@nuvoton.com>
 <1651f0ee-5667-c7ef-9cb0-a648e2ad7d02@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KSyhVCl2eeZHT0Rn"
Content-Disposition: inline
In-Reply-To: <1651f0ee-5667-c7ef-9cb0-a648e2ad7d02@linux.intel.com>
X-Cookie: Sentient plasmoids are a gas.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com,
 Seven Lee <wtli@nuvoton.com>, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com, CTLIN0@nuvoton.com, dardar923@gmail.com,
 supercraig0719@gmail.com
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


--KSyhVCl2eeZHT0Rn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 11:02:57AM -0500, Pierre-Louis Bossart wrote:
> On 8/23/21 11:16 PM, Seven Lee wrote:

> > +static inline void nau8821_sema_release(struct nau8821 *nau8821)
> > +{
> > +	if (!nau8821->irq)
> > +		return;
> > +	up(&nau8821->jd_sem);
> > +}

> is there any specific reason why Nuvoton codec drivers use a semaphore?
> isn't a mutex good enough?

I've been asking for documentation of what's going on with the locking
on every revision of this so far to no success.  As far as I can tell
the driver is doing something weird where it needs to take and release
the lock in different contexts which doesn't work with the kernel's
mutex implementation where you need to take and release the mutex in the
same context.

> > +	switch (event) {
> > +	case SND_SOC_DAPM_POST_PMU:
> > +		msleep(125);
>=20
> use a define to keep track of sleep times in a header file?

I'm never sure that moving the magic numbers for sleeps out of line is
actually helpful, it's an extra barrier to figuring out the actual
sequence of operations and unless there's multiple users of the same
underlying delay it doesn't really buy anything.

--KSyhVCl2eeZHT0Rn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmElLTQACgkQJNaLcl1U
h9DeVgf/ZPAWKIU9Ieyhu/6m+oELrf3xt4JNro6T1EMPMCIdh1yItSgVDRI04nU4
5BsSunkYHkCBF55Q9QCpoKoYKcWpf+ORX6OOY3t0hNNA9FgDwvjHDqSNYJ14MF/P
h4P/SeQCpqNGNoe7pLVeEly+ROCcAnafNjKidluVrD9TbbrBe73SlX5buowbznvU
/S9mPp3CYFTdoAeyVyvyJBTWnntnEwizeyigaHk3ResfK777wBVcGxjKP+rcslI3
YRxbVtef6VtH7bBO8KQkhOa0U9GlCMNE4Xjsm1TeDKC5iY74jFARgBbd409+LVzy
tfhu25GK5pl4u29sH1qm5vD+ATsNqg==
=cEw/
-----END PGP SIGNATURE-----

--KSyhVCl2eeZHT0Rn--
