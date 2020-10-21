Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D3E294C22
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 14:01:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58C42173E;
	Wed, 21 Oct 2020 14:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58C42173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603281691;
	bh=yM/uez8AhDZR6dQdRQ+07+2hqG7pIm7SsX24KeznL08=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hs+7LHLuCR7tZdAmPoBzjkchIoPmAdKj7scuhz0g0qSbyIOBzSrYDyqXWqnCknxLE
	 RLIRjUz49bDw6Hxt1Fg7l7/G1daYYWM+sM5EAJXyYVchNzCgFydooD8s8KSUY7Q/lk
	 4TxJJ5j0U3Ripiu/fF62h3ziVXiu1Cw57uKhNfq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E925FF80247;
	Wed, 21 Oct 2020 13:59:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAAEBF80264; Wed, 21 Oct 2020 13:59:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0A9BF80247
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 13:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0A9BF80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cMw2En0B"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C393121D7B;
 Wed, 21 Oct 2020 11:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603281579;
 bh=yM/uez8AhDZR6dQdRQ+07+2hqG7pIm7SsX24KeznL08=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cMw2En0BpGf2R3CyuN/7pWHpOHF6L6pANFvCN3eNHWJGNqpsmEivvZxqOAXdYR1/q
 2EXqrYvjxs5Y5Ejf3hMdTXhlR57FlaCnKgtidhQWLYc6DR/a2UQuqSJnvt9gw/IH3y
 FDy7vu6VMO5gB0GrE2veyUsGC0XeK3HC0YY0ZnIc=
Date: Wed, 21 Oct 2020 12:59:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [GIT PULL] ASoC updates for v5.10
Message-ID: <20201021115928.GB4497@sirena.org.uk>
References: <20201012130845.816462076C@mail.kernel.org>
 <a31e2b24-9ef4-c84f-a663-c2a44b0c8938@perex.cz>
 <20201012132857.GC4332@sirena.org.uk>
 <0cfec32c-c0b4-ddbc-6a23-f5b898966c48@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline
In-Reply-To: <0cfec32c-c0b4-ddbc-6a23-f5b898966c48@perex.cz>
X-Cookie: That does not compute.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
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


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2020 at 10:23:18AM +0200, Jaroslav Kysela wrote:
> Dne 12. 10. 20 v 15:28 Mark Brown napsal(a):

> > Yes, looks like they didn't make it.  Nothing looks particularly urgent
> > in there.

> Another week and this is ignored. At least, I cannot find this simple patch
> set in your for-5.10 tree. I don't care about the cosmetic code fixes, but the

As you have identified that series looks like minor code cleanups, I am
not going to apply minor code cleanups as bug fixes, you should be aware
that during the merge window only bug fixes go in and therefore have no
expectation that anything else will be applied during that time.  Your
previous mail was sent after the merge window opened.

> last warning suppression can reduce the maintainer / user confusions ("ASoC:
> SOF: loader: handle all SOF_IPC_EXT types").

This is the first time you or anyone else has mentioned this as being
differentiated from anything else in the series, had someone done so
perhaps it might have been reasonable to have an expectation that it
might be reasonable to expect that something could happen sooner.

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+QIp8ACgkQJNaLcl1U
h9DwZAf9GwB2DsoPW4eyhb8yrjasO4Uz0qIHFucLOzV6BQn36aLlsdnXBwZkiDG9
oHmOIkAs7E+Es0/Ii0dc6M5unMJ6zn83OLovLTFvhc7sUQdEHzuNKZ//wn9XF8Bj
bOMfuAtYtxtbh/HxQOBUoVSamQkjwA8ovuXUHmaTCT7PghPqR/o64CtBRgCfsL9Z
yrXGT8fK65DuHWAPOkDZ80n4bgc1X5eNisOM+jdGnE+q76+EUIWgzgE5NGAm2Q10
oO/o1nZdkucE4bzNcoHI9Cd4yPjL2SSTXXvTQeG704MGHz2q2nsiVUX1TlPOuKLC
3BzP7DO6FE2TKHlvMabjNDqiFHockQ==
=kZG+
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
