Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8045D2D41D1
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 13:12:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7444C169A;
	Wed,  9 Dec 2020 13:12:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7444C169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607515975;
	bh=H4T4O1tzRPs47wemXlxyDf0b9bnc+MA1eZ3s4yqERbE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C6ot7OnvJaFfu4P1Nj9utPR1uhQ6ytpFxAFRGRLi4drs4kzeWDyDvzYiR+Z5BsnIH
	 2bosBEMRgAdu4zEVFr+AOPES+SbWjSakLflpBpXpFwFNuMH6xkc+goeR9tUrf00n8C
	 4diqIwBZsApUDzVdLqDqov80prCmLgrES0J5AGXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3B9CF801D8;
	Wed,  9 Dec 2020 13:12:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55CEDF8012C; Wed,  9 Dec 2020 13:12:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4588F8012C
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 13:11:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4588F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FonfmIfY"
Date: Wed, 9 Dec 2020 12:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607515913;
 bh=H4T4O1tzRPs47wemXlxyDf0b9bnc+MA1eZ3s4yqERbE=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=FonfmIfYXlL2135i10D0nGrh9NuFscbPasUwULxn0lX953aG7ibsqiIocJk556nq3
 ekiVUkyYmaVhNN83MUFUPWODkH4M7YezNl8mTYrphNi7W198PLjCw90xKUirMBJDjY
 RcH0n5m/BRVlRdmX7I7Id4FJjbQb4w7z3ky71FUy94ABH2M/HIMIdJXH/DutHlQFgj
 1zItCh+vd/jCNdeD5WjvquM5lvSXHB7dMVoDF6bPjNrGtKDMCjFdOyc5Dl07u5mPqy
 MIEQ1A2FIwCYxDvt7KRdQOuvvpIdOMMbEOgBdWJ63KpXRbC2etdYymJuC8bMuNNelm
 5rvuCeHCpWuFA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: rt1015p: delay 300ms after SDB pulling high for
 calibration
Message-ID: <20201209121146.GB4790@sirena.org.uk>
References: <20201209033742.3825973-1-tzungbi@google.com>
 <fd713bbf-2983-8803-1ac3-3d9a59efaf6a@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Content-Disposition: inline
In-Reply-To: <fd713bbf-2983-8803-1ac3-3d9a59efaf6a@perex.cz>
X-Cookie: sillema sillema nika su
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Tzung-Bi Shih <tzungbi@google.com>, alsa-devel@alsa-project.org
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


--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 09, 2020 at 10:30:43AM +0100, Jaroslav Kysela wrote:
> Dne 09. 12. 20 v 4:37 Tzung-Bi Shih napsal(a):
> > RT1015p needs 300ms delay after SDB pulling high for internal
> > calibration during the power on sequence.

> > Delays 300ms right before data sends out to avoid data truncated.

> I think that this codec driver should be redesigned to add this power-up delay
> the the correct sequence like in rt1015.c - rt1015_amp_drv_event().

> Those huge delays in the trigger callbacks looks and are messy.

Right, trigger is supposed to be very fast and this sort of stuff would
normally be part of the power up sequence and those are handled through
DAPM.  set_bias_level() is another option for placing this sort of thing
depending on what exactly is being controlled here.

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/QvwIACgkQJNaLcl1U
h9Ah3Af+PBmsgEaEkoCEdbDEgauX2EY99uHM8g4XmlJPWoilQz8/4LWQZViLy6sh
moZyY++wBVrP0z3pxyCtuhnF0QDFFEQOwfSeoafv4bNaSf54vNuanwZSpidEX35I
5QaejZn1cRLUy390q6cJZXTtDgHyTuHHTATYiKq5b4Daj91JgDMXlqwgs9MHBlg/
2flEnRbHyf9mgtmwS5U3TyyFdgTdHpxlpVbHtoHyi/NDzln/JwyZVX8MWXNlJInt
prvJNaUKSOcgU7skhrfw5F8JfxB+9o/O7/X3WdavccKFCdPlBp+iBh/0FrKejFqP
1GE57xgbiOirbHv356PYe1xVPkOr6w==
=1Cf8
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--
