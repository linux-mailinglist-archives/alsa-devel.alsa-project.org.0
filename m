Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7727D25D3FE
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 10:53:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0FCA1AE9;
	Fri,  4 Sep 2020 10:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0FCA1AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599209610;
	bh=PhnaNKA7rh3rCmuBd9zqv2v0Wg8ZgqsYufgBwArPwbM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WpLWBqGNcT2kBwi97hQpxrXr3ZOtpEakrQ4QxpoDxDUEvKXOVhcQEUYHh1NHqwRAH
	 jtiIwc3sWv8G6jk7GgF6/VyDn5rzDRvLeXiWsUjXaA7nEJ2GPpU5PNLTvcsR8ikADo
	 be1MLyglnZbzgTIdfUMT5lDoTv/2kkOWuNUFuEoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28A94F8024A;
	Fri,  4 Sep 2020 10:51:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97CA5F8024A; Fri,  4 Sep 2020 10:51:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CDBDF800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 10:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CDBDF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xMNCTVYo"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77C3B20722;
 Fri,  4 Sep 2020 08:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599209500;
 bh=PhnaNKA7rh3rCmuBd9zqv2v0Wg8ZgqsYufgBwArPwbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xMNCTVYoGPXOo41ItsVPDv5S7/3Oi934cJg4QiWeIaG5jb/fo3hWwiMpuMg7JqJpX
 Ub+9eOf9TKnsp2792rx76tDtRnSpeJ09Z7mhPnvQ1JJnCBv+T5RfcdJJB8Y248eeC7
 Hz82Jt4oHqO38x17Z1HMoSgxXZoLZFEhExzmH9rI=
Date: Fri, 4 Sep 2020 09:50:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 0/3] alsa-lib/ASoC: use inclusive language for
 bclk/fsync/topology
Message-ID: <20200904085058.GA4625@sirena.org.uk>
References: <20200903201024.1109914-1-pierre-louis.bossart@linux.intel.com>
 <cac824a4-3882-85dd-dc0b-8366090dce94@perex.cz>
 <9d1c96ad-6860-7a98-4e22-5f566665e7e7@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <9d1c96ad-6860-7a98-4e22-5f566665e7e7@linux.intel.com>
X-Cookie: Heisenberg might have been here.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2020 at 04:32:22PM -0500, Pierre-Louis Bossart wrote:
> On 9/3/20 3:42 PM, Jaroslav Kysela wrote:

> >=20
> > Only my 2 cents: It's just another word combo. See bellow for sources f=
or others.
> >=20
> > I would prefer probably provider/consumer . It sounds more technic.

> Thanks Jaroslav for chiming in. I had a similar set of comments in intern=
al
> reviews, but we didn't really have any consensus and I have not seen good
> guidance specifically for clocks.

> Provider/consumer is typically used for discrete data exchange with some
> sort of locking and buffer fullness metric, but for clocks we'd want
> something that hints at one device following the timing defined by anothe=
r.

> "follow" or "track" seem clearer than 'consume' IMHO, but I will side with
> the majority, this is an RFC which can be modified at will.

Producer/consumer is already quite widely used for clocks (possibly
following the regulator API which was templated off the clock API and
uses consumer).  The follow/track stuff definitely seems awkward to me.
Have we seen any movement from anyone like CODEC vendors on this?

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9R//EACgkQJNaLcl1U
h9D8zgf+JOQUT7KJ1tzh+5VcgoVfDtQHrz8gBAzitfUG2Z4fZHjDVnoIp+nPcMq/
Y9hPutTex7i//BGOfSm2qcUooiPOZtCnIh4WZb+QYTE8Y6wymYpQZUFJhJ2jUqxO
7eWZZKGMVUe/O7nnvZDUleYfNo7wDBPQ1hflXbSJsABdy6cDoDZmOsCMn2IJx98m
zrC6DaEBKrk55JXNRjUxfN9ZvR10IBVJjSd3SKoTs9sd0DD05UBrCGQtbEO1orB2
WglbdyF4GRn6ZerarRnPwgg0sgrjdG6Su/vb9A2ZO3wVyheBjd5C/yQu5noorZKY
pEB5Ll1XU1pItDX9K4WmuZz3rB7Tpw==
=QC7L
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
