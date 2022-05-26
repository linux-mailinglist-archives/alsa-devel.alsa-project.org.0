Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D5F53504E
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 16:00:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1DC016C0;
	Thu, 26 May 2022 16:00:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1DC016C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653573655;
	bh=975OuZJI+i/Nu98ugEB98JotVNd4Lk60REXVRCnuiT8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RuKsi1c0h8DDViugH0269TxTCuaUbSIRkA0Kv3lynOjYZL0Vnl1cIYyFiAd5Fq4Qn
	 fH2wl1zT4Ys9vDDgWURMsHMpEnPkfXbecAchASZcwj+WE72DIv3RSlq7kkzYx9QutD
	 Lq0w44F7bXVd9ZAB5bS6iuzB5x+saTKj47fFrxaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D7FCF80171;
	Thu, 26 May 2022 15:59:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7B81F8014B; Thu, 26 May 2022 15:59:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F496F80100
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 15:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F496F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bq0liYVw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 07D9E61B11;
 Thu, 26 May 2022 13:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A24B4C385A9;
 Thu, 26 May 2022 13:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653573591;
 bh=975OuZJI+i/Nu98ugEB98JotVNd4Lk60REXVRCnuiT8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bq0liYVwQxM7fZFnvjWHHfj49PDju+Nhn8026Rme8eVYKu2ClwD2jMNlKWnBaRXTh
 aSMGXbrtXSUk8wvAksZULRG/3hJM3/HvXlNr9khmr1xEn65NW+ferBAh3mdbLZvXFT
 tutiP2Yt0dHuDyZNRynVJqvrHnHAmSuFQThoxs4kBDVKitQ1QGEsnEXfHEfnxpWyhN
 dfHNfeY5TL3NU/gTDq0+e5w0AqiWX5z8qZlz/w+ZqjY/XdgAHXL8ZUSQT8xpLtjhHx
 DiiJmgIKhwT7gtQAzywHREFnmh8rTqoqfUM/m1wiCP7+V42qcFo7KRvNqJkdqS+YjV
 FgGwoDgv/JOFA==
Date: Thu, 26 May 2022 14:59:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 00/14] ASoC: Intel: avs: Machine boards and HDA codec
 support
Message-ID: <Yo+H0De5AiX6CRKs@sirena.org.uk>
References: <20220511162403.3987658-1-cezary.rojewski@intel.com>
 <8d2bba16-8b07-45ac-b990-714967fab9aa@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YfDMHqrv+qM9aG/3"
Content-Disposition: inline
In-Reply-To: <8d2bba16-8b07-45ac-b990-714967fab9aa@intel.com>
X-Cookie: Money is the root of all wealth.
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com,
 kai.vehmanen@linux.intel.com, harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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


--YfDMHqrv+qM9aG/3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2022 at 12:14:09PM +0200, Cezary Rojewski wrote:

> Friendly ping as PCM series got merged but this one looks orphaned :(
> Patches addressing fls() issues reported by bots have been sent as separa=
te
> series [1].

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--YfDMHqrv+qM9aG/3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKPh9AACgkQJNaLcl1U
h9Cacwf/WemGtlyRWxAB8lA4s4lj92VvfA0W5vBpwYz5v69/8XRy5A9RmDCo+DYY
7D/pmJlh/ji1NZ+oJeSGsp1Dk5AQxexPLWHjDntOqa0fRl5wn4gxW2R/Bmc9Rc7O
pqDzQ55s/xFWYAUi9rixMzmEqszjeDc+5HgboJkZlkrU2BnUZG3zgJEevkBOptbv
YRV6+TcoVZlK9fAhoDYZlndblU5j8fdUTn6HauExlgfPGwiPPVlZrETUHJzxGtPU
HPiId5e7QeKXcvc1x86nKmTNHIlY4mFS07sQmv4ogS91A3HZDDAghhUgCs3X1Wmd
d1urrccnpbi5QU+5oIUc+097yFZpVQ==
=jIXU
-----END PGP SIGNATURE-----

--YfDMHqrv+qM9aG/3--
