Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1521D55FD
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 18:26:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC3E71671;
	Fri, 15 May 2020 18:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC3E71671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589560011;
	bh=/Dtf3F9gB23nTxw/HVRwYjk4muN4X3PGPjit0aNcoDM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NC1ISOLvZy+hJXTRnO4vEPBJBHMuxBgoaclSmNABkzPOUwuCRIS5NWA4uWUVPiDTz
	 sOb0ppyGiId7zaETGWguLpEoqT5O6qVqPIgpHQqqWtOb11Kv9ZXAvZ0siYMWzBlKgx
	 yyLU7joLsWzAxSgxPaN+UDqr5+DzQqho7emyUxQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5D6BF800B8;
	Fri, 15 May 2020 18:25:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41597F80254; Fri, 15 May 2020 18:25:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2845AF80101
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 18:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2845AF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hoRF7rWh"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E911D206D8;
 Fri, 15 May 2020 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589559905;
 bh=/Dtf3F9gB23nTxw/HVRwYjk4muN4X3PGPjit0aNcoDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hoRF7rWhVkxm+vhJern6JCNrF/2Rk4yuBIZ1Mn8SfF3EOwx3y3ecrSimOTo+hvsQh
 buja6EYXXBdMVFGwVE4WZRkcS9URq7dUbYC1/kVAdRQ8EH8Pjd8BmbhtA358zy3l8/
 d+3SKAvU0Wy4fDkPDu7zaA42JFxOACNfCBZ2P2lY=
Date: Fri, 15 May 2020 17:25:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 0/4] Kconfig updates for DMIC and SOF HDMI support
Message-ID: <20200515162502.GF5066@sirena.org.uk>
References: <20200427165211.23463-1-ranjani.sridharan@linux.intel.com>
 <00d4ea9242cad11b7aab10326b7430f6106d63e3.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4f28nU6agdXSinmL"
Content-Disposition: inline
In-Reply-To: <00d4ea9242cad11b7aab10326b7430f6106d63e3.camel@linux.intel.com>
X-Cookie: Avoid contact with eyes.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com
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


--4f28nU6agdXSinmL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 09:14:24AM -0700, Ranjani Sridharan wrote:

> I see that you applied the series in your merge commit below but your
> for-next branch only has the first patch in the series and the
> remaining 3 are missing. Just wanted to check with you if I should
> resend them.

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

--4f28nU6agdXSinmL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6+wl4ACgkQJNaLcl1U
h9BRKQf9HrtQctukCK9Ti7b2Z0bhWyDl0fJJl/bKC5ImHhAC3T3RJnCMqiOJxb16
UOqBL8X4BruJjS7JmJIzFbWzN+muHxNGZRjW4qZ8dEYLSgiSZHgh0ZeGiMW/S0g0
1a3yxTtDCfgTMW9aRZRFJBYzCERqlFYMmH7xRvjGJkV3yVBeDsYdulKlC4ZtOPtT
oXhhFUbvJ67AdRgHTysSFiqhNFZvS0BG09nTzSXVi4HV4VUfEmGRif0Zy8MzMB3X
p1Kr6NvBC/wQ+2t8hlhDLPxXm9sv6W6atqavT0FJpuc6uwePAzrZsdyfW0U+JW5N
FTgH3uPnJrzZxKhwn8rCtaEcgvEAQg==
=webC
-----END PGP SIGNATURE-----

--4f28nU6agdXSinmL--
